package
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.filters.GlowFilter;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class ToolBar extends Sprite
    {
        
        private var curPlace:Place;
        
        public function ToolBar()
        {
            
            initUI();
        }
        
        private function initUI():void
        {
            for (var tool:Place, i:int = 0; i < 2; i++)
            {
                tool = new Place(i);
                tool.y = i * 30;
                addChild(tool);
                tool.addEventListener(MouseEvent.CLICK, onClick);
            }
        }
        
        private function onClick(e:MouseEvent):void
        {
            if (curPlace)
            {
                curPlace.filters = [];
            }
            
            curPlace = e.target as Place;
            curPlace.filters = [new GlowFilter(0x008000, 0.5, 8, 8, 4)];
            
            Config.selectedPlace = curPlace;
        }
    
    }

}