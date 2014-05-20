package nicegame.core
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import nicegame.ui.ColorBox;
    import nicegame.vo.Position;
    
    /**
     * 游戏逻辑
     * @author Seven Yu
     */
    public class Game extends Sprite
    {
        // 行列数
        private const COLS:uint = 23;
        private const ROWS:uint = 16;
        
        // 当前点击方块
        private var curBox:ColorBox;
        // 方块数组
        private var boxs:Array;
        // 消除方块
        private var markList:Array;
        
        public function Game()
        {
            reset();
            
            addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            var pos:Position = point2position(e.localX, e.localY);
            checkFromHere(boxs[pos.row][pos.col]);
        }
        
        /**
         * 检测方块
         * @param	box		检测起点(被点击的方块)
         */
        private function checkFromHere(box:ColorBox):void
        {
            if (box == null)
                return;
            markList = [];
            curBox = box;
            checkAround(box);
            var len:int = markList.length
            // 大于三个消除
            if (len >= 3)
            {
                for (var i:int = 0; i < len; i++)
                {
                    box = markList[i];
                    removeChild(box);
                    boxs[box.pos.row][box.pos.col] = null;
                }
            }
            // 填充空位
            fillEmptyBox();
        }
        
        /**
         * 填充空位
         */
        private function fillEmptyBox():void
        {
            // 由上向下遍历
            for (var i:int = 0; i < ROWS; i++)
            {
                for (var j:int = 0; j < COLS; j++)
                {
                    if (boxs[i][j] == null)
                        fixCol(i, j);
                }
            }
        }
        
        /**
         * 检测方块周围的方块
         * @param	box
         */
        private function checkAround(box:ColorBox):void
        {
            var around:Array = getAround(box);
            
            // 放入待消除列表
            markList.push(box);
            
            for (var i:int = 0, l:int = around.length; i < l; i++)
            {
                box = around[i] as ColorBox;
                if (markList.indexOf(box) == -1 && box.color == curBox.color)
                {
                    // 若属性相同, 继续检测
                    checkAround(box);
                }
            }
        }
        
        /**
         * 获取相邻方块
         * @param	box
         * @return	相邻方块数组
         */
        private function getAround(box:ColorBox):Array
        {
            var result:Array = [];
            
            var uBox:ColorBox = getBox(box.pos, -1, 0);
            var rBox:ColorBox = getBox(box.pos, 0, 1);
            var dBox:ColorBox = getBox(box.pos, 1, 0);
            var lBox:ColorBox = getBox(box.pos, 0, -1);
            
            uBox && result.push(uBox);
            rBox && result.push(rBox);
            dBox && result.push(dBox);
            lBox && result.push(lBox);
            
            return result;
        }
        
        /**
         * 依据行列坐标获取方块
         * @param	pos			位置
         * @param	rowOffset	行偏移量
         * @param	colOffset	列偏移量
         * @return
         */
        private function getBox(pos:Position, rowOffset:int = 0, colOffset:int = 0):ColorBox
        {
            return boxs[pos.row + rowOffset] ? boxs[pos.row + rowOffset][pos.col + colOffset] : null;
        }
        
        /**
         * 移动列
         * @param	row
         * @param	col
         */
        private function fixCol(row:int, col:int):void
        {
            // 从最底层开始, 将上方方块向下移动
            for (var nextBox:ColorBox, i:int = row; i > 0; i--)
            {
                nextBox = boxs[i - 1][col];
                if (nextBox == null)
                    break;
                nextBox.pos = new Position(i, col);
                nextBox.y += ColorBox.SIZE;
                boxs[i][col] = nextBox;
            }
            // 最顶层创建新方块
            //return; // 若顶层不再出现新方块可注释掉该行
            nextBox = new ColorBox();
            addChild(nextBox);
            nextBox.pos = new Position(0, col);
            nextBox.x = col * ColorBox.SIZE;
            boxs[0][col] = nextBox;
        }
        
        /**
         * 初始化
         */
        public function reset():void
        {
            boxs = [];
            for (var i:int = 0; i < ROWS; i++)
            {
                var line:Array = [];
                for (var j:int = 0; j < COLS; j++)
                {
                    var cb:ColorBox = new ColorBox();
                    addChild(cb);
                    cb.pos = new Position(i, j);
                    cb.x = j * ColorBox.SIZE;
                    cb.y = i * ColorBox.SIZE;
                    line.push(cb);
                }
                boxs.push(line);
            }
        }
        
        /**
         * 坐标转换为行列
         * @param	px	横坐标
         * @param	py	纵坐标
         * @return	行列值
         */
        private function point2position(px:int, py:int):Position
        {
            var result:Position = new Position();
            result.col = Math.floor(px / ColorBox.SIZE);
            result.row = Math.floor(py / ColorBox.SIZE);
            return result;
        }
    
    }

}