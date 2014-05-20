package
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import morn.core.handlers.Handler;
    import nicegame.ui.MainWin;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        public function Main():void
        {
            App.init(this);
            App.loader.loadAssets(['assets/comp.swf', 'assets/custom.swf'], new Handler(loadComplete));
        }
        
        private function loadComplete():void
        {
            var win:MainWin = new MainWin();
            addChild(win);
            
            win.addEventListener(MouseEvent.MOUSE_DOWN, downHandler);
        }
        
        private function downHandler(e:MouseEvent):void
        {
        
        }
    
    }

}