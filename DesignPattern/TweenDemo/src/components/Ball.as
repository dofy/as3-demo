package components 
{
	import flash.display.Sprite;
	
	/**
     * ...
     * @author 1209C
     */
    public class Ball extends Sprite 
    {
        
        public function Ball() 
        {
            graphics.beginFill(0x008000);
            graphics.drawCircle(0, 0, 20);
            graphics.endFill();
        }
        
    }

}