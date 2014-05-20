package effect 
{
    import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Particle extends Sprite 
    {
        
        public function Particle(display:DisplayObject) 
        {
            super();
			addChild(display);
        }
        
    }

}