package nicegame.components
{
    import flash.display.Graphics;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MapGrid extends Sprite
    {
        
        public static const THROW:int = 0;
        public static const STOP:int = 1;
        public static const TRANS:int = 2;
        
        private const GRID_ALPHA:Number = 0.3;
        
        // 格子高度
        public static const GRID_SIZE:int = 30;
        // 半高
        public static const HALF_SIZE:int = GRID_SIZE / 2;
        // 格子宽度
        public static const DOUBLE_SIZE:int = GRID_SIZE * 2;
        
        private const LINE_COLOR:uint = 0x999999;
        private const COLORS:Array = [0x008000, 0xff0000, 0xffcc00];
        
        private var _type:int;
        
        public function MapGrid(row:int, col:int, type:int = 0)
        {
            var tf:TextField = new TextField();
            tf.selectable = false;
            tf.defaultTextFormat = new TextFormat('consolas', 9, 0x666666);
            tf.autoSize = TextFieldAutoSize.LEFT;
            tf.x = tf.y = -10;
            tf.text = [row, col].join();
            addChild(tf);
            
            this.type = type;
        }
        
        private function render():void
        {
            var g:Graphics = this.graphics;
            g.clear();
            g.lineStyle(1, LINE_COLOR, GRID_ALPHA);
            g.beginFill(COLORS[type], GRID_ALPHA);
            g.moveTo(0, -HALF_SIZE);
            g.lineTo(GRID_SIZE, 0);
            g.lineTo(0, HALF_SIZE);
            g.lineTo(-GRID_SIZE, 0);
            g.lineTo(0, -HALF_SIZE);
            g.endFill();
        }
        
        public function get type():int
        {
            return _type;
        }
        
        public function set type(value:int):void
        {
            _type = value;
            render();
        }
    
    }

}