package nicegame.demo.controller
{
    import nicegame.demo.model.GameDataProxy;
    import nicegame.demo.model.SettingsProxy;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class InitProxysCommand extends SimpleCommand
    {
        
        override public function execute(note:INotification):void
        {
            facade.registerProxy(new GameDataProxy);
            facade.registerProxy(new SettingsProxy);
        }
    
    }

}