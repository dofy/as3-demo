package  
{
    import org.phpz.Assets;
    import starling.core.Starling;
    import starling.display.MovieClip;
	import starling.display.Sprite;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Root extends Sprite 
    {
        
        public function Root() 
        {
            super();
			
            
            var mc:MovieClip = new MovieClip(Assets.getTextures('mt1'), 24);
            addChild(mc);
            
            Starling.juggler.add(mc);
        }
        
    }

}