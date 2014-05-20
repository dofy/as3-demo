package nicegame.demo.view.components
{
    import fla.assets.Selector;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class SelectorGroup extends Sprite
    {
        
        private var curSelector:Selector;
        
        private var values:Array;// = [10, 50, 100];
        
        public function SelectorGroup(arr:Array)
        {
            values = arr;
            initUI();
        }
        
        private function initUI():void
        {
            for (var i:int = 0, l:int = values.length, selector:Selector; i < l; i++)
            {
                selector = new Selector();
                selector.num = values[i];
                addChild(selector);
                selector.x = i * 100;
                selector.addEventListener(MouseEvent.CLICK, onSelect);
                
                if (i == 0)
                {
                    curSelector = selector;
                    selector.selected = true;
                }
            }
        }
        
        private function onSelect(e:MouseEvent):void
        {
            curSelector && (curSelector.selected = false);
            curSelector = e.currentTarget as Selector;
            curSelector.selected = true;
            
            // 派发事件, 上层容器监听事件
            dispatchEvent(new Event(Event.CHANGE));
        }
        
        public function get num():int
        {
            return curSelector ? curSelector.num : 0;
        }
    
    }

}