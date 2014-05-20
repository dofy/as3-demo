package ui 
{
	import flash.display.Sprite;
    import utils.Global;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Box extends Sprite 
    {
        
        public function Box() 
        {
            super();
			addChild(new GridItem(Global.GRID_SIZE));
        }
        
    }

}