package nicegame.demo.controller
{
    import flash.display.Stage;
    import nicegame.demo.FacadeApp;
    import nicegame.demo.view.AppMediaor;
    import nicegame.demo.view.GamePageMediator;
    import nicegame.demo.view.HelpPageMediator;
    import nicegame.demo.view.SettingsPageMediator;
    import nicegame.demo.view.StartPageMediator;
    import org.puremvc.as3.interfaces.INotification;
    import org.puremvc.as3.patterns.command.SimpleCommand;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class InitMediatorCommand extends SimpleCommand
    {
        
        override public function execute(note:INotification):void
        {
            var stage:Stage = note.getBody() as Stage;
            
            facade.registerMediator(new AppMediaor(stage));
            facade.registerMediator(new StartPageMediator);
            facade.registerMediator(new GamePageMediator);
            facade.registerMediator(new HelpPageMediator);
            facade.registerMediator(new SettingsPageMediator);
            
            sendNotification(FacadeApp.GAME_INIT, StartPageMediator.NAME);
        }
    
    }

}