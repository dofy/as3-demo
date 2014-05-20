package ui
{
    import configs.UIConfig;
    import flash.display.Shape;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Grid extends Shape
    {
        
        private var _color:uint = 0;
        
        private var _bind:Boolean = false;
        
        public function empty():void
        {
            _color = 0;
            _bind = false;
            graphics.clear();
        }
        
        public function fill(color:uint = 0, bind:Boolean = false):void
        {
            if (_color == color || color == 0)
                return;
            
            _bind = bind;
            _color = color;
            graphics.clear();
            graphics.lineStyle(UIConfig.LINE_WEIGHT, UIConfig.COLOR_LINE);
            graphics.beginFill(color);
            graphics.drawRoundRect(0, 0, UIConfig.GRID_SIZE, UIConfig.GRID_SIZE, UIConfig.ELLIPSE);
            graphics.endFill();
        }
        
        public function get isFull():Boolean
        {
            return _color > 0 && bind;
        }
        
        public function get color():uint
        {
            return _color;
        }
        
        public function get bind():Boolean
        {
            return _bind;
        }
    
    }

}