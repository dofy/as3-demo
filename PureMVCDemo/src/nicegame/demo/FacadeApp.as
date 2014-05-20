package nicegame.demo
{
    import flash.display.Stage;
    import nicegame.demo.controller.StartupCommand;
    import nicegame.demo.view.AppMediaor;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.interfaces.IFacade;
    import org.puremvc.as3.interfaces.IMediator;
    import org.puremvc.as3.interfaces.IProxy;
    import org.puremvc.as3.patterns.facade.Facade;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class FacadeApp extends Facade implements IFacade
    {
        
        public static const START_UP:String = 'start_up';
        
        public static const GAME_INIT:String = 'game_init';
        
        public static const GAME_STATE_CHANGED:String = 'game_state_changed';
        public static const SETTINGS_CHANGED:String = 'settings_changed';
        
        public static const KEY_DOWN:String = 'key_down';
        
        public static const SHOW_GAME:String = 'show_game';
        public static const SHOW_HELP:String = 'show_help';
        public static const SHOW_SETTINGS:String = 'show_settings';
        public static const HIDE_GAME:String = 'hide_game';
        public static const HIDE_HELP:String = 'hide_help';
        public static const HIDE_SETTINGS:String = 'hide_settings';
        
        public static function getInstance():FacadeApp
        {
            if (instance == null)
                instance = new FacadeApp;
            return instance as FacadeApp;
        }
        
        override protected function initializeController():void 
        {
            super.initializeController();
            
            registerCommand(START_UP, StartupCommand);
            
        }
        
        public function start(stage:Stage):void
        {
            sendNotification(START_UP, stage);
        }
    
    }

}