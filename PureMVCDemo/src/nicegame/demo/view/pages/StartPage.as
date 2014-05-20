package nicegame.demo.view.pages
{
    import fla.assets.BtnHelp;
    import fla.assets.BtnSettings;
    import fla.assets.BtnStart;
    import fla.assets.LblStartPage;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import nicegame.demo.events.AppEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class StartPage extends BasePage
    {
        
        override protected function initUI():void
        {
            super.initUI();
            
            addChild(new LblStartPage);
            
            var btnStart:BtnStart = addChild(new BtnStart) as BtnStart;
            btnStart.addEventListener(MouseEvent.CLICK, startHandler);
            btnStart.x = 550;
            btnStart.y = 450;
            
            var btnHelp:BtnHelp = addChild(new BtnHelp) as BtnHelp;
            btnHelp.addEventListener(MouseEvent.CLICK, helpHandler);
            btnHelp.x = 20;
            btnHelp.y = 350;
            
            var btnSettings:BtnSettings = addChild(new BtnSettings) as BtnSettings;
            btnSettings.addEventListener(MouseEvent.CLICK, settingHandler);
            btnSettings.x = 20;
            btnSettings.y = 450;
        }
        
        private function startHandler(e:MouseEvent):void
        {
            dispatchEvent(new AppEvent(AppEvent.BTN_START));
        }
        
        private function helpHandler(e:MouseEvent):void
        {
            dispatchEvent(new AppEvent(AppEvent.BTN_HELP));
        }
        
        private function settingHandler(e:MouseEvent):void
        {
            dispatchEvent(new AppEvent(AppEvent.BTN_SETTINGS));
        }
    
    }

}