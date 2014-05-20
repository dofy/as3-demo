package nicegame.demo.view
{
    import flash.display.DisplayObject;
    import flash.display.Stage;
    import flash.events.KeyboardEvent;
    import nicegame.demo.FacadeApp;
    import org.puremvc.as3.interfaces.IMediator;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.mediator.Mediator;
    
    /**
     * 最低层的容器, 控制游戏界面和键盘监听
     * @author Seven Yu
     */
    public class AppMediaor extends Mediator implements IMediator
    {
        
        public static const NAME:String = 'appMediator';
        
        public function AppMediaor(viewComponent:Object = null)
        {
            super(NAME, viewComponent);
        }
        
        override public function onRegister():void 
        {
            super.onRegister();
            
            stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
        }
        
        private function onKeyDown(e:KeyboardEvent):void 
        {
            sendNotification(FacadeApp.KEY_DOWN, e.keyCode);
        }
        
        override public function listNotificationInterests():Array
        {
            return [
                // 游戏开始
                FacadeApp.GAME_INIT,
                // 显示界面
                FacadeApp.SHOW_GAME,
                FacadeApp.SHOW_HELP,
                FacadeApp.SHOW_SETTINGS, 
                // 结束界面
                FacadeApp.HIDE_GAME,
                FacadeApp.HIDE_HELP,
                FacadeApp.HIDE_SETTINGS
                ];
        }
        
        override public function handleNotification(note:INotification):void
        {
            var body:String = note.getBody() as String;
            var mediator:BasePageMediator = facade.retrieveMediator(body) as BasePageMediator;
            
            switch (note.getName())
            {
                case FacadeApp.GAME_INIT:
                    stage.addChild(mediator.page);
                    break;
                case FacadeApp.SHOW_GAME:
                case FacadeApp.SHOW_HELP:
                case FacadeApp.SHOW_SETTINGS:
                    stage.addChild(mediator.page);
                    break;
                case FacadeApp.HIDE_GAME:
                case FacadeApp.HIDE_HELP:
                case FacadeApp.HIDE_SETTINGS:
                    stage.removeChild(mediator.page);
                default: 
                    // nothing...
                    break;
            }
        }
        
        public function get stage():Stage
        {
            return viewComponent as Stage;
        }
    
    }

}