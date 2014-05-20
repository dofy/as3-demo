package utils
{
    import flash.display.Graphics;
    import flash.geom.Point;
    
    /**
     * A* 寻路
     * @author Seven Yu
     */
    public class AStar
    {
        
        // 直线评价
        private const LINE1_STYLE:Number = 1;
        // 斜线评价
        private const LINE2_STYLE:Number = 1.4;
        
        // 地图数据
        private var _mapData:Array;
        // 待评价节点数组
        private var openList:Array;
        // 评价过节点数组
        private var closeList:Array;
        
        // 终点坐标(行, 列)
        private var endRow:int;
        private var endCol:int;
        
        private var tf:Function;
        
        /**
         * A*
         * @param mapData   地图数据
         */
        public function AStar(mapData:Array, testFunc:Function = null)
        {
            _mapData = mapData;
            
            tf = testFunc;
        }
        
        /**
         * 寻找路径
         * @param startRow  起始点行坐标
         * @param startCol  起始点列坐标
         * @param endRow    终点行坐标
         * @param endCol    终点列坐标
         * @return
         */
        public function findPath(startRow:int, startCol:int, endRow:int, endCol:int):Array
        {
            var curNode:Node, tmpNodes:Array;
            
            openList = [];
            closeList = [];
            
            this.endRow = endRow;
            this.endCol = endCol;
            
            // 起始节点放入 openList
            open(new Node(startRow, startCol, null, 0, 0));
            
            while (openList.length > 0)
            {
                // 从 openList 中最小评价值节点开始
                curNode = openList[0];
                // 若该节点为终点, 返回路径
                if (curNode.row == endRow && curNode.col == endCol)
                {
                    return getPath(curNode);
                }
                // 当前节点放入 closeList
                close(curNode);
                // 得到周围节点
                tmpNodes = getArondNodes(curNode);
                for (var i:int = 0, l:int = tmpNodes.length; i < l; i++)
                {
                    open(tmpNodes[i]);
                }
            }
            
            return [];
        }
        
        /**
         * 获取最终路径
         * @param node
         * @return
         */
        private function getPath(node:Node):Array
        {
            var arr:Array = [node];
            while (node.parent)
            {
                arr.unshift(node.parent);
                node = node.parent;
            }
            return arr;
        }
        
        /**
         * 放入openList
         * @param node  节点
         */
        private function open(node:Node):void
        {
            if (!inOpenList(node) && !inCloseList(node))
            {
                // 按评价放入 openList
                for (var i:int = 0, l:int = openList.length; i < l; i++)
                {
                    // 分值低(代价小)的放前面
                    if (node.f < openList[i].f)
                    {
                        openList.splice(i, 0, node);
                        return;
                    }
                }
                openList.push(node);
            }
        }
        
        private function close(node:Node):void
        {
            closeList.push(openList.shift());
            // test
            tf && tf(node);
        }
        
        private function inOpenList(node:Node):Boolean
        {
            for each (var n:Node in openList)
            {
                if (n.col == node.col && n.row == node.row)
                {
                    return true;
                }
            }
            return false;
        }
        
        private function inCloseList(node:Node):Boolean
        {
            for each (var n:Node in closeList)
            {
                if (n.col == node.col && n.row == node.row)
                {
                    return true;
                }
            }
            return false;
        }
        
        /**
         * 获取周围点
         * @param node
         * @return
         */
        private function getArondNodes(node:Node):Array
        {
            var result:Array = [];
            var curNode:Node;
            
            if (!getNode(node, 0, 0))
            {
                return [];
            }
            
            // 上
            curNode = getNode(node, -1, 0);
            curNode && result.push(curNode);
            
            // 右
            curNode = getNode(node, 0, 1);
            curNode && result.push(curNode);
            
            // 下
            curNode = getNode(node, 1, 0);
            curNode && result.push(curNode);
            
            // 左
            curNode = getNode(node, 0, -1);
            curNode && result.push(curNode);
            
            // 左上
            curNode = getNode(node, -1, -1);
            curNode && result.push(curNode);
            
            // 右上
            curNode = getNode(node, -1, 1);
            curNode && result.push(curNode);
            
            // 左下
            curNode = getNode(node, 1, -1);
            curNode && result.push(curNode);
            
            // 右下
            curNode = getNode(node, 1, 1);
            curNode && result.push(curNode);
            
            return result;
        }
        
        /**
         * 获取指定位置的点, 并进行评价
         * @param parent        父节点
         * @param rowOffset     行偏移量
         * @param colOffset     列偏移量
         * @return
         */
        private function getNode(parent:Node, rowOffset:int, colOffset:int):Node
        {
            var result:Node, n:Number, l:Number;
            var row:int = parent.row + rowOffset;
            var col:int = parent.col + colOffset;
            if (_mapData[row] && _mapData[row][col])
            {
                // 位置评分
                n = (rowOffset == colOffset || rowOffset + colOffset == 0) ? LINE2_STYLE : LINE1_STYLE;
                // 距终点距离评分
                //l = Math.sqrt(Math.pow(endRow - row, 2) + Math.pow(endCol - col, 2));
                //trace(l);
                l = Math.abs(endRow - row) + Math.abs(endCol - col);
                //trace(l);
                //var a:Number = Math.abs(endRow - row),
                    //b:Number = Math.abs(endCol - col),
                    //c:Number = Math.abs(a - b),
                    //d:Number = Math.min(a, b);
                //l = Math.sqrt(d * d) + c;
                //trace(l);
                //trace('------------------');
                //l = 0;
                return new Node(row, col, parent, parent.c + n, l);
            }
            else
            {
                return null;
            }
        }
        
        /**
         * 更新地图数据
         */
        public function set mapData(value:Array):void
        {
            _mapData = value;
        }
    }
}
