package ui
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Group extends Sprite
    {
        
        public static const SIZE:int = 4;
        
        public static const GRID_SIZE:int = 35;
        
        private var _data:Array;
        
        private var fillCount:int;
        
        public function Group()
        {
            init();
            bindEvents();
        }
        
        private function init():void
        {
            _data = [];
            fillCount = 0;
            for (var i:int = 0, line:Array; i < SIZE; i++)
            {
                line = [];
                for (var j:int = 0, box:Box; j < SIZE; j++)
                {
                    line.push(0);
                    box = new Box(i, j, GRID_SIZE);
                    box.x = j * GRID_SIZE;
                    box.y = i * GRID_SIZE;
                    addChild(box);
                }
                _data.push(line);
            }
        }
        
        private function bindEvents():void
        {
            this.addEventListener(MouseEvent.MOUSE_DOWN, clickHandler);
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            var box:Box = e.target as Box;
            box.isFill = !box.isFill;
            fillCount += box.isFill ? 1 : -1;
            _data[box.row][box.col] = box.isFill ? 1 : 0;
        }
        
        public function reset():void
        {
            while (numChildren)
            {
                removeChildAt(0);
            }
            init();
        }
        
        public function get data():Array
        {
            return _data;
        }
        
        public function get hasData():Boolean
        {
            return fillCount > 0;
        }
    
    }

}