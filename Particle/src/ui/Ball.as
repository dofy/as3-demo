package ui 
{
	import flash.display.Sprite;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Sprite 
    {
        
        public function Ball() 
        {
            super();
			addChild(new BallShape(10));
        }
        
    }

}