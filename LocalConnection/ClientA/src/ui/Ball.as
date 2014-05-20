package ui 
{
	import flash.display.Shape;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Shape 
    {
        
        public function Ball() 
        {
            super();
			graphics.beginFill(0x008000);
            graphics.drawCircle(0, 0, 100);
            graphics.endFill();
        }
        
    }

}