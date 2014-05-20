package ui 
{
	import flash.display.Shape;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Shape 
    {
        
        public function Ball(color:uint) 
        {
            graphics.beginFill(color);
            graphics.drawCircle(0, 0, 4);
            graphics.endFill();
        }
        
    }

}