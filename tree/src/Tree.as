package
{
    import com.greensock.TweenLite;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.xml.XMLNode;
    
    /**
     * 菜单树
     */
    public class Tree extends Sprite
    {
        
        // 所有节点
        private var nodes:Vector.<Node>;
        
        // 选中节点(高亮)
        private var selectedNodes:Vector.<Node>;
        
        public function Tree(data:XML)
        {
            nodes = new Vector.<Node>;
            selectedNodes = new Vector.<Node>;
            
            // 添加第一层
            addNodes(null, data.cat);
        }
        
        /**
         * 添加子节点
         * @param node          父节点
         * @param childrenData  子节点数据
         */
        private function addNodes(node:Node, childrenData:XMLList):void
        {
            var children:Vector.<Node> = new Vector.<Node>;
            var startIndex:int = node ? node.index + 1 : 0;
            var len:int = childrenData.length();
            // 临时保存当前父节点的子节点
            for (var i:int = 0, newNode:Node; i < len; i++)
            {
                children.push(addNode(node, node ? node.level + 1 : 0, startIndex + i, childrenData[i]));
            }
            node && (node.children = children);
            // 添加完成后, 移动后面节点坐标
            for (var j:int = startIndex + len, k:int = nodes.length; j < k; j++)
            {
                nodes[j].index += len;
            }
        }
        
        /**
         * 添加单个节点
         * @param parent    父节点
         * @param level     层级
         * @param index     索引
         * @param nodeData  节点数据
         * @return          添加后的节点
         */
        private function addNode(parent:Node, level:int, index:int, nodeData:XML):Node
        {
            var node:Node = new Node(parent, level, nodeData);
            // 按索引插入节点数组
            nodes.splice(index, 0, node);
            node.index = index;
            addChild(node);
            TweenLite.from(node, 0.3, {alpha: 0});
            node.addEventListener(MouseEvent.CLICK, onClick);
            return node;
        }
        
        /**
         * 点击节点事件
         * @param e
         */
        private function onClick(e:MouseEvent):void
        {
            var node:Node = e.target as Node;
            trace(node.title, node.url);
            // 派发事件, 显示影片
            dispatchEvent(new TreeEvent(TreeEvent.NODE_CLICK, node.title, node.url));
            // 处理高亮
            highlightNodes(node);
            // 显示/隐藏 子节点
            if (node.canOpen)
            {
                // 隐藏
                if (node.isOpen)
                {
                    node.isOpen = false;
                    removeNodes(node.index, node.children);
                }
                // 显示
                else
                {
                    node.isOpen = true;
                    addNodes(node, node.childData);
                }
            }
        }
        
        /**
         * 高亮节点以及所属父节点
         * @param node
         */
        private function highlightNodes(node:Node):void
        {
            // 取消当前已经高亮的节点
            while (selectedNodes.length > 0)
            {
                (selectedNodes.pop() as Node).highlight = false;
            }
            
            highlightNode(node);
        }
        
        /**
         * 高亮单个节点(递归调用)
         * @param node
         */
        private function highlightNode(node:Node):void
        {
            selectedNodes.push(node);
            node.highlight = true;
            
            if (node.parentNode != null)
            {
                highlightNode(node.parentNode);
            }
        }
        
        /**
         * 移除节点
         * @param index     移除节点父节点的索引
         * @param children  要移除的子节点
         */
        private function removeNodes(index:int, children:Vector.<Node>):void
        {
            // 遍历子节点
            for (var node:Node, i:int = 0, cLen:int = children.length; i < cLen; i++)
            {
                node = children[i];
                // 若子节点中有展开的子节点
                if (node.isOpen && node.canOpen)
                {
                    // 递归移除
                    removeNodes(node.index, node.children);
                }
            }
            
            // 从数组中移除子节点
            nodes.splice(index + 1, cLen);
            
            // 遍历移除节点
            while (children.length > 0)
            {
                var one:Node = children.pop();
                one.removeEventListener(MouseEvent.CLICK, onClick);
                removeChild(one);
            }
            
            // 修正移除节点下面节点的坐标
            for (var j:int = index + 1, nLen:int = nodes.length; j < nLen; j++)
            {
                nodes[j].index -= cLen;
            }
        }
    
    }

}