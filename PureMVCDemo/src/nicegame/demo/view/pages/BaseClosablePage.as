package nicegame.demo.view.pages
{
    import fla.assets.BtnClose;
    import flash.events.MouseEvent;
    import nicegame.demo.events.AppEvent;
    
    /**
     * 带关闭按钮页面基类
     * @author Seven Yu
     */
    public class BaseClosablePage extends BasePage
    {
        private var btnClose:BtnClose;
        
        override protected function initUI():void
        {
            super.initUI();
            btnClose = addChild(new BtnClose) as BtnClose;
            btnClose.addEventListener(MouseEvent.CLICK, closeHandler);
            btnClose.x = 750;
            btnClose.y = 10;
        }
        
        private function closeHandler(e:MouseEvent):void
        {
            dispatchEvent(new AppEvent(AppEvent.BTN_CLOSE));
        }
    
    }

}