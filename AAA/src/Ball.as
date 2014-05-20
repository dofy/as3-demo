package  
{
	import flash.display.Sprite;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Sprite 
    {
        
        private var _r:Number;
        
        public function Ball(r:Number) 
        {
			this.r = r;
        }
        
        public function get r():Number 
        {
            return _r;
        }
        
        public function set r(value:Number):void 
        {
            _r = value;
            graphics.clear();
            graphics.beginFill(0xffcc00);
            graphics.drawCircle(0, 0, _r);
            graphics.endFill();
        }
        
    }

}