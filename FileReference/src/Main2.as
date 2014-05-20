package
{
    import flash.display.Sprite;
    import flash.sampler.NewObjectSample;
    import morn.core.handlers.Handler;
    import utils.SOTool;
    import view.Dialog1;
    import view.MainPage;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main2 extends Sprite
    {
        
        public function Main2()
        {
            super();
            
            App.init(this);
            App.loader.loadAssets(['assets/comp.swf','assets/map.swf','assets/other.swf'], new Handler(onComplete));
        }
        
        private function onComplete():void
        {
            addChild(new MainPage());
            //App.dialog.show(new Dialog1());
            App.dialog.popup(new Dialog1());
        }
    
    }

}