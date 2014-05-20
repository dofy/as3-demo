package ui 
{
	import flash.display.Shape;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Box extends Shape 
    {
        
        public function Box(alpha:Number) 
        {
            graphics.beginFill(0, alpha);
            graphics.drawRect(0, 0, 50, 50);
            graphics.endFill();
        }
        
    }

}