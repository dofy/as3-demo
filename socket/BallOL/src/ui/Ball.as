package ui
{
    import flash.display.Shape;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Shape
    {
        
        private var _id:String;
        
        private var _color:uint;
        
        public function Ball(id:String, color:uint = 0)
        {
            super();
            
            _id = id;
            _color = color > 0 ? color : Math.round(Math.random() * (0xffffff - 1)) + 1;
            
            graphics.beginFill(_color, 0.7);
            graphics.drawCircle(0, 0, 50);
            graphics.endFill();
        }
        
        public function get id():String
        {
            return _id;
        }
        
        public function get color():uint 
        {
            return _color;
        }
    
    }

}