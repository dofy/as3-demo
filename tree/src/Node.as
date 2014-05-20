package
{
    import com.greensock.TweenLite;
    import flash.display.Sprite;
    import flash.filters.GlowFilter;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    
    /**
     * 节点类
     */
    public class Node extends Sprite
    {
        
        // 子节点集合
        public var children:Vector.<Node>;
        
        private var txt:TextField;              // 文本框
        private var data:XML;                   // 数据
        private var _childData:XMLList;         // 子节点数据
        private var _isOpen:Boolean = false;    // 是否已经展开
        private var _index:int;                 // 节点索引
        private var _level:int;                 // 节点层级
        private var _parentNode:Node;           // 父节点
        
        /**
         * 节点构造
         * @param parentNode
         * @param level
         * @param data
         */
        public function Node(parentNode:Node, level:int, data:XML)
        {
            mouseChildren = false;
            buttonMode = true;
            
            _parentNode = parentNode;
            
            // 根据层级计算横坐标
            _level = level;
            this.x = level * 18;
            
            this.data = data;
            _childData = data.cat;
            
            // 渲染文本框
            txt = new TextField();
            txt.selectable = false;
            txt.autoSize = TextFieldAutoSize.LEFT;
            txt.defaultTextFormat = new TextFormat('consolas', 17);
            addChild(txt);
            
            // 初始化展开符号
            isOpen = !canOpen;
        }
        
        public function get title():String
        {
            return data.@title || '';
        }
        
        public function get url():String
        {
            return data.@url || '';
        }
        
        public function get childData():XMLList
        {
            return _childData;
        }
        
        public function get canOpen():Boolean
        {
            return _childData && _childData.length() > 0;
        }
        
        public function get isOpen():Boolean
        {
            return _isOpen;
        }
        
        public function set isOpen(value:Boolean):void
        {
            _isOpen = value;
            // 有子节点
            if (canOpen)
            {
                // 打开显示 -, 折叠显示 +
                txt.text = (value ? '-' : '+');
            }
            // 没有子节点的显示一个 .
            else
            {
                txt.text = '.';
            }
            txt.appendText(' ' + data.@title);
        }
        
        public function get index():int
        {
            return _index;
        }
        
        public function set index(value:int):void
        {
            _index = value;
            this.y = value * 25;
        }
        
        public function get level():int
        {
            return _level;
        }
        
        /**
         * 高亮节点
         */
        public function set highlight(value:Boolean):void
        {
            txt.filters = value ? [new GlowFilter(0x00ff00)] : [];
        }
        
        /**
         * 父节点
         */
        public function get parentNode():Node 
        {
            return _parentNode;
        }
    
    }

}