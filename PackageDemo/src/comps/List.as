package comps
{
    import comm.Global;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
	[Event(name="select", type="flash.events.Event")] 
    public class List extends Sprite
    {
        
        private const ITEM_WIDTH:int = 120;
        private const ITEM_HEIGHT:int = 70;
        private const ITEM_PADDING:int = 5;
        
        private var rows:int;
        private var cols:int;
        
        private var _data:Array;
        
        private var items:Vector.<ListItem>;
        
        private var _selectedItem:ListItem;
        
        public function List(rows:int = 3, cols:int = 4)
        {
            super();
            this.rows = rows;
            this.cols = cols;
            
            graphics.beginFill(0x008000, 0.3);
            graphics.drawRect(0, 0, cols * (ITEM_WIDTH + ITEM_PADDING) - ITEM_PADDING, rows * (ITEM_HEIGHT + ITEM_PADDING) - ITEM_PADDING);
            graphics.endFill();
            
            addEventListener(MouseEvent.CLICK, onClick, true);
        }
        
        private function onClick(e:MouseEvent):void
        {
            _selectedItem = e.target as ListItem;
            
            dispatchEvent(new Event(Event.SELECT));
        }
        
        public function get data():Array
        {
            return _data;
        }
        
        public function set data(value:Array):void
        {
            _data = value;
            
            for (var i:int = 0,l:int=value.length; i < l; i++) 
            {
                _data[i].data = Global.skills[_data[i].id];
            }
            
            createItems();
        }
        
        public function get selectedItem():ListItem
        {
            return _selectedItem;
        }
        
        private function createItems():void
        {
            clear();
            
            for (var i:int = 0, l:int = _data.length; i < l; i++)
            {
                var item:ListItem = new ListItem();
                item.data = _data[i];
                addChild(item);
                
                item.x = i % cols * (ITEM_WIDTH + ITEM_PADDING);
                item.y = Math.floor(i / cols) * (ITEM_HEIGHT + ITEM_PADDING);
                
                items.push(item);
            }
        }
        
        private function clear():void
        {
            items = new Vector.<ListItem>;
            removeChildren();
        }
    
    }

}