package ui
{
    import flash.display.Sprite;
    import flash.geom.Point;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Map extends Sprite
    {
        
        static private var _map:Map;
        
        private const EASY:Number = 0.3;
        
        private var ROWS:int = 15;
        private var COLS:int = 20;
        
        public static const GRID_SIZE:int = 30;
        
        private var _data:Array;
        
        // test data
        private var testData:Array = [
	[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,0,1,1,1,1,1,1,0,0,1,1,1,0,0,1,1,1,1,1,1,1,0,0,0,1,1],
	[1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,0,0,1,1,1,1,1,0,1,1,0,1,1],
	[1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,0,0,1,1,1,0,0,1,1,0,0,1],
	[1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,0,0,1,1,1,1,0,1],
	[1,1,1,1,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,1,1,0,1,1,1,1,1,0,1],
	[1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,0,0,1,1,1,1,0,0],
	[1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,0,1,1,1,1,0,0],
	[1,1,1,1,0,1,1,1,1,1,1,1,0,1,1,1,1,1,0,0,1,1,1,0,1,1,1,1,0,1],
	[1,1,1,1,0,0,1,1,1,1,1,0,0,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1],
	[1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1],
	[1,1,1,1,1,0,0,1,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1],
	[1,1,1,1,1,1,0,0,1,1,1,0,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,0,1],
	[1,1,1,1,1,1,1,0,0,0,0,0,1,1,1,1,1,1,0,0,1,1,1,1,1,1,0,0,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
];
        
        public function Map(m:M = null)
        {
            if (m == null)
            {
                throw new Error('请用 map 属性获取单例');
            }
            //reset();
            test();
        }
        
        static public function get map():Map
        {
            if (_map == null)
            {
                _map = new Map(new M);
            }
            return _map;
        }
        
        public function reset():void
        {
            // 重置数据
            _data = [];
            graphics.clear();
            graphics.lineStyle(1);
            // 绘制地图
            for (var i:int = 0; i < ROWS; i++)
            {
                for (var j:int = 0, arr:Array = []; j < COLS; j++)
                {
                    var walkable:Boolean = Math.random() > EASY;
                    arr.push(walkable);
                    graphics.beginFill(walkable ? 0xffffff : 0);
                    graphics.drawRect(j * GRID_SIZE, i * GRID_SIZE, GRID_SIZE, GRID_SIZE);
                    graphics.endFill();
                }
                _data.push(arr);
            }
        }
        
        private function test():void
        {
            ROWS = testData.length;
            COLS = testData[0].length;
            
            _data = testData;
            
            graphics.clear();
            graphics.lineStyle(1);
            // 绘制地图
            for (var i:int = 0; i < ROWS; i++)
            {
                for (var j:int = 0; j < COLS; j++)
                {
                    graphics.beginFill(testData[i][j] ? 0xffffff : 0);
                    graphics.drawRect(j * GRID_SIZE, i * GRID_SIZE, GRID_SIZE, GRID_SIZE);
                    graphics.endFill();
                }
            }
        }
        
        public function get randWalkablePoint():Point
        {
            var row:int = Math.floor(Math.random() * ROWS);
            var col:int = Math.floor(Math.random() * COLS);
            if (_data[row][col])
            {
                return gridToPoint(row, col);
            }
            else
            {
                return randWalkablePoint;
            }
        }
        
        public function get data():Array
        {
            return _data;
        }
        
        public function getGridByPoint(point:Point):Boolean
        {
            var g:Point = pointToGrid(point);
            return !!g && _data[g.x][g.y];
        }
        
        public function pointToGrid(point:Point):Point
        {
            var gX:int = Math.floor(point.x / GRID_SIZE);
            var gY:int = Math.floor(point.y / GRID_SIZE);
            return new Point(gX, gY);
            return _data[gY] ? (_data[gY][gX] ? new Point(gX, gY) : null) : null;
        }
        
        public function gridToPoint(row:int, col:int):Point
        {
            return new Point(col * GRID_SIZE + GRID_SIZE / 2, row * GRID_SIZE + GRID_SIZE / 2);
        }
    
    }

}

class M
{
}