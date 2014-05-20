package
{
    import bwie.game.Scene;
    import flash.display.Sprite;
    import flash.events.Event;
    import morn.core.handlers.Handler;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        public function Main():void
        {
            App.
            App.init(this);
            App.loader.loadAssets(['assets/vector.swf', 'assets/comp.swf', 'assets/other.swf', 'assets/nav.swf', 'assets/map.swf'], new Handler(loadCompleteHandler));
        }
        
        private function loadCompleteHandler():void
        {
            var s:Scene = new Scene();
            addChild(s);
            
            stage.addEventListener(Event.RESIZE, function(e:Event):void
                {
                    s.setSize(stage.stageWidth, stage.stageHeight);
                });
        }
    
    }

}