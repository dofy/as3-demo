package nicegame.demo.view.pages
{
    import fla.assets.LblSettings;
    import fla.assets.LblSpeed;
    import flash.events.Event;
    import nicegame.demo.events.AppEvent;
    import nicegame.demo.view.components.SelectorGroup;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class SettingsPage extends BaseClosablePage
    {
        
        override protected function initUI():void
        {
            super.initUI();
            addChild(new LblSettings);
            
            var lblSpeed:LblSpeed = addChild(new LblSpeed) as LblSpeed;
            lblSpeed.x = 50;
            lblSpeed.y = 100;
            
            var selectorGroup:SelectorGroup = new SelectorGroup([1, 3, 5, 7, 9]);
            addChild(selectorGroup);
            selectorGroup.x = 50;
            selectorGroup.y = 150;
            selectorGroup.addEventListener(Event.CHANGE, onChange);
        }
        
        private function onChange(e:Event):void
        {
            // 当选择了不同的速度设置, 配发事件
            dispatchEvent(new AppEvent(AppEvent.CHANGED, (e.target as SelectorGroup).num));
        }
    
    }

}