package nicegame.demo.view.pages
{
    import fla.assets.LblHelpPage;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class HelpPage extends BaseClosablePage
    {
        
        override protected function initUI():void
        {
            super.initUI();
            addChild(new LblHelpPage);
        }
    }

}