package
{
    import flash.display.Sprite;
    import starling.core.Starling;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        public function Main():void
        {
            var s:Starling = new Starling(Root, stage);
            s.showStats = true;
            s.start();
        }
    
    }

}