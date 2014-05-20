package nicegame.demo.controller
{
    import org.puremvc.as3.patterns.command.MacroCommand;
    
    /**
     * Startup 宏命令
     * @author Seven Yu
     */
    public class StartupCommand extends MacroCommand
    {
        
        override protected function initializeMacroCommand():void
        {
            super.initializeMacroCommand();
            // 初始化数据
            addSubCommand(InitProxysCommand);
            // 初始化 Mediator
            addSubCommand(InitMediatorCommand);
        }
    
    }

}