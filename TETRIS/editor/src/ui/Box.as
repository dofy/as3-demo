package ui
{
    import flash.display.Sprite;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Box extends Sprite
    {
        
        private const COLOR_FILL:uint = 0xcccccc;
        private const COLOR_NULL:uint = 0xffffff;
        
        private var _isFill:Boolean;
        
        private var _size:int;
        
        private var _row:int;
        private var _col:int;
        
        public function Box(row:int, col:int, size:int = 20)
        {
            _row = row;
            _col = col;
            _size = size;
            isFill = false;
        }
        
        public function get isFill():Boolean
        {
            return _isFill;
        }
        
        public function set isFill(value:Boolean):void
        {
            _isFill = value;
            
            graphics.clear();
            graphics.lineStyle(2);
            graphics.beginFill(value ? COLOR_FILL : COLOR_NULL);
            graphics.drawRect(0, 0, _size, _size);
            graphics.endFill();
        }
        
        public function get row():int 
        {
            return _row;
        }
        
        public function get col():int 
        {
            return _col;
        }
    
    }

}