package nicegame.demo.view
{
    import nicegame.demo.events.AppEvent;
    import nicegame.demo.FacadeApp;
    import nicegame.demo.view.pages.HelpPage;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class HelpPageMediator extends BasePageMediator
    {
        
        public static const NAME:String = 'helpPageMediator';
        
        public function HelpPageMediator()
        {
            super(NAME, new HelpPage);
        }
        
        override public function onRegister():void 
        {
            super.onRegister();
            page.addEventListener(AppEvent.BTN_CLOSE, onClose);
        }
        
        private function onClose(e:AppEvent):void 
        {
            sendNotification(FacadeApp.HIDE_HELP, NAME);
        }
    
    }

}