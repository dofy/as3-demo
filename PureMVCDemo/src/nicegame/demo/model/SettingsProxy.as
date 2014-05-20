package nicegame.demo.model
{
    import nicegame.demo.FacadeApp;
    import nicegame.demo.model.vo.GameVO;
    import nicegame.demo.model.vo.SettingsVO;
    import org.puremvc.as3.interfaces.IProxy;
    import org.puremvc.as3.patterns.proxy.Proxy;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class SettingsProxy extends Proxy implements IProxy
    {
        
        public static const NAME:String = 'settingsProxy';
        
        public function SettingsProxy()
        {
            super(NAME, new SettingsVO);
        }
        
        override public function setData(data:Object):void 
        {
            super.setData(data);
            sendNotification(FacadeApp.SETTINGS_CHANGED, getData());
        }
        
        public function set speed(value:int):void
        {
            (data as SettingsVO).speed = value;
            sendNotification(FacadeApp.SETTINGS_CHANGED, value);
        }
        
        public function get speed():int
        {
            return (data as SettingsVO).speed;
        }
    
    }

}