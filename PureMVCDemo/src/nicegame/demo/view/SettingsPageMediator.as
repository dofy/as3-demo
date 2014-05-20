package nicegame.demo.view
{
    import nicegame.demo.events.AppEvent;
    import nicegame.demo.FacadeApp;
    import nicegame.demo.model.SettingsProxy;
    import nicegame.demo.view.pages.SettingsPage;
    import org.puremvc.as3.interfaces.IMediator;
    import org.puremvc.as3.interfaces.INotifier;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class SettingsPageMediator extends BasePageMediator implements IMediator, INotifier
    {
        
        public static const NAME:String = 'settingsPageMediator';
        
        private var settings:SettingsProxy;
        
        public function SettingsPageMediator()
        {
            super(NAME, new SettingsPage);
        }
        
        override public function onRegister():void
        {
            super.onRegister();
            settings = facade.retrieveProxy(SettingsProxy.NAME) as SettingsProxy;
            
            page.addEventListener(AppEvent.BTN_CLOSE, onClose);
            page.addEventListener(AppEvent.CHANGED, onChanged);
        }
        
        private function onClose(e:AppEvent):void 
        {
            sendNotification(FacadeApp.HIDE_SETTINGS, NAME);
        }
        
        private function onChanged(e:AppEvent):void 
        {
            // 收到 UI 中速度设置的变化, 修改数据对象
            settings.speed = e.data as int;
        }
    
    }

}