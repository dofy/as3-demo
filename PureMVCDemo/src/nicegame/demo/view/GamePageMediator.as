package nicegame.demo.view
{
    import nicegame.demo.events.AppEvent;
    import nicegame.demo.FacadeApp;
    import nicegame.demo.model.GameDataProxy;
    import nicegame.demo.model.SettingsProxy;
    import nicegame.demo.view.pages.GamePage;
    import org.puremvc.as3.interfaces.IMediator;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.interfaces.INotifier;
    
    /**
     * 游戏容器
     * @author Seven Yu
     */
    public class GamePageMediator extends BasePageMediator implements IMediator, INotifier
    {
        
        public static const NAME:String = 'gamePageMediator';
        
        private var gameData:GameDataProxy;
        private var settings:SettingsProxy;
        
        public function GamePageMediator()
        {
            super(NAME, new GamePage);
        }
        
        override public function onRegister():void
        {
            super.onRegister();
            gameData = facade.retrieveProxy(GameDataProxy.NAME) as GameDataProxy;
            settings = facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy;
            
            (page as GamePage).speed = settings.speed;
            page.addEventListener(AppEvent.BTN_SETTINGS, onButtonClicked);
            page.addEventListener(AppEvent.BTN_HELP, onButtonClicked);
            page.addEventListener(AppEvent.BTN_EXIT, onButtonClicked);
        }
        
        override public function listNotificationInterests():Array
        {
            return [FacadeApp.SHOW_GAME, FacadeApp.KEY_DOWN, FacadeApp.SETTINGS_CHANGED];
        }
        
        override public function handleNotification(note:INotification):void
        {
            var name:String = note.getName();
            var body:Object = note.getBody();
            
            switch (name)
            {
                case FacadeApp.SHOW_GAME: 
                    if (gameData.state == 1)
                        return;
                    (page as GamePage).reset();
                    gameData.state = 1;
                    break;
                case FacadeApp.KEY_DOWN: 
                    if (gameData.state == 0)
                        return;
                    (page as GamePage).move(body as int);
                    break;
                case FacadeApp.SETTINGS_CHANGED: 
                    (page as GamePage).speed = settings.speed;
                    //(page as GamePage).speed = body as int;
                    break;
                default: 
                    // nothing...
                    break;
            }
        }
        
        private function onButtonClicked(e:AppEvent):void
        {
            switch (e.type)
            {
                case AppEvent.BTN_SETTINGS: 
                    sendNotification(FacadeApp.SHOW_SETTINGS, SettingsPageMediator.NAME);
                    break;
                case AppEvent.BTN_HELP: 
                    sendNotification(FacadeApp.SHOW_HELP, HelpPageMediator.NAME);
                    break;
                case AppEvent.BTN_EXIT: 
                    (page as GamePage).dispose();
                    gameData.state = 0;
                    sendNotification(FacadeApp.HIDE_GAME, NAME);
                    break;
            }
        }
    
    }

}