package nicegame.demo.view
{
    import nicegame.demo.view.pages.BasePage;
    import org.puremvc.as3.interfaces.IMediator;
    import org.puremvc.as3.interfaces.INotifier;
    import org.puremvc.as3.patterns.mediator.Mediator;
    
    /**
     * PageMediator 基类
     * @author Seven Yu
     */
    public class BasePageMediator extends Mediator implements IMediator, INotifier
    {
        
        public function BasePageMediator(mediatorName:String = null, viewComponent:Object = null)
        {
            super(mediatorName, viewComponent);
        }
        
        public function get page():BasePage
        {
            return viewComponent as BasePage;
        }
    
    }

}