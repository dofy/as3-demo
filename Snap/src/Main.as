package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import ui.Box;
    import ui.Grid;
    import utils.Global;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var grid:Grid;
        
        public function Main():void
        {
            if (stage)
                init();
            else
                addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // entry point
            
            // 格子
            grid = new Grid(3, 4);
            addChild(grid);
            grid.x = 100;
            grid.y = 100;
            
            // 拖拽的方块
            var box:Box = new Box();
            addChild(box);
            box.x = 600;
            box.y = 200;
            
            // 拖拽事件，并控制开始/结束检测
            box.addEventListener(MouseEvent.MOUSE_DOWN, onDown);
            box.addEventListener(MouseEvent.MOUSE_UP, onUp);
        }
        
        private function onDown(e:MouseEvent):void 
        {
            // 开始拖拽
            e.target.startDrag();
            
            // 开始检测
            grid.beginCheck();
        }
        
        private function onUp(e:MouseEvent):void 
        {
            var box:Box = e.target as Box;
            
            // 停止拖拽
            box.stopDrag();
            
            // 停止检测
            grid.endCheck();
            
            // 如果有匹配的方块
            if (grid.inOneItem)
            {
                // 放置到对应方块的位置上
                box.x = grid.x + grid.curCol * Global.GRID_SIZE;
                box.y = grid.y + grid.curRow * Global.GRID_SIZE;
            }
            // 否则
            else
            {
                // 回复原始位置
                box.x = 600;
                box.y = 200;
            }
        }
    
    }

}