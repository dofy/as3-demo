package
{
    import flash.display.Sprite;
    import morn.core.handlers.Handler;
    import org.phpz.pages.MainPage;
    
    /**
     * ...
     * @author Seven Yu
     */
    
    public class Main extends Sprite
    {
        public function Main()
        {
            App.init(this);
            App.loader.loadAssets(['assets/comp.swf'], new Handler(completeHandler));
        }
        
        private function completeHandler():void
        {
            var mp:MainPage = addChild(new MainPage) as MainPage;
        }
    }

}