package nicegame.demo.view
{
    import flash.display.SimpleButton;
    import flash.events.MouseEvent;
    import nicegame.demo.events.AppEvent;
    import nicegame.demo.FacadeApp;
    import nicegame.demo.view.pages.StartPage;
    import org.puremvc.as3.interfaces.IMediator;
    import org.puremvc.as3.interfaces.INotification;
    
    /**
     * 开始界面
     * @author Seven Yu
     */
    public class StartPageMediator extends BasePageMediator implements IMediator
    {
        
        public static const NAME:String = 'startPageMediator';
        
        public function StartPageMediator()
        {
            super(NAME, new StartPage);
        }
        
        override public function onRegister():void
        {
            super.onRegister();
            page.addEventListener(AppEvent.BTN_START, onStart);
            page.addEventListener(AppEvent.BTN_HELP, onHelp);
            page.addEventListener(AppEvent.BTN_SETTINGS, onSettings);
            
            // 点击任意位置
            page.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            // 若点击了按钮
            if (e.target is SimpleButton)
                return; // 不做处理
            
            // 其他任意位置开始游戏
            onStart(null);
        }
        
        override public function listNotificationInterests():Array
        {
            return [FacadeApp.KEY_DOWN];
        }
        
        override public function handleNotification(note:INotification):void
        {
            switch (note.getName())
            {
                case FacadeApp.KEY_DOWN: 
                    onStart(null);
                    break;
                default: 
            }
        }
        
        private function onStart(e:AppEvent):void
        {
            sendNotification(FacadeApp.SHOW_GAME, GamePageMediator.NAME);
        }
        
        private function onHelp(e:AppEvent):void
        {
            sendNotification(FacadeApp.SHOW_HELP, HelpPageMediator.NAME);
        }
        
        private function onSettings(e:AppEvent):void
        {
            sendNotification(FacadeApp.SHOW_SETTINGS, SettingsPageMediator.NAME);
        }
    
    }

}