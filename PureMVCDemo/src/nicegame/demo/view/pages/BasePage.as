package nicegame.demo.view.pages 
{
	import flash.display.Sprite;
    import flash.events.Event;
    import nicegame.demo.utils.ColorTool;
	
	/**
     * 页面基类
     * @author Seven Yu
     */
    public class BasePage extends Sprite 
    {
        
        public function BasePage() 
        {
            super();
            init();
			initUI();
            addEventListener(Event.ADDED_TO_STAGE, onAdded);
        }
        
        protected function init():void 
        {
            
        }
        
        protected function initUI():void
        {
            render();
        }
        
        private function onAdded(e:Event):void 
        {
            render();
        }
        
        private function render():void 
        {
            graphics.beginFill(ColorTool.random);
            graphics.drawRect(0, 0, 800, 600);
            graphics.endFill();
        }
        
    }

}