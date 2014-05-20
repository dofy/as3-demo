package nicegame.components
{
    import flash.display.Sprite;
    import flash.geom.Point;
    
    /**
     * 2.5d 地图
     * @author Seven Yu
     */
    public class Map extends Sprite
    {
        
        private var _mapRow:int;
        private var _mapCol:int;
        
        private var _mapWidth:int;
        private var _mapHeight:int;
        
        /**
         * 地图
         * @param width     地图宽(px)
         * @param height    地图高(px)
         */
        public function Map(width:int, height:int)
        {
            _mapWidth = width;
            _mapHeight = height;
            
            _mapRow = Math.ceil(_mapHeight / MapGrid.GRID_SIZE);
            _mapCol = Math.ceil(_mapWidth / MapGrid.DOUBLE_SIZE);
            
            trace('map row:', mapRow, 'map col:', mapCol, 'grid size:', gridSize);
			trace(gridToPoint(0, 0), gridToPoint(3, 6));
            
            initGrid();
        }
        
        private function initGrid():void
        {
            // help line
            graphics.lineStyle(1, 0xff0000);
            graphics.drawRect(0, 0, mapWidth, mapHeight);
            graphics.endFill();
            
            // create grids
            var grid:MapGrid;
            for (var i:int = 0; i < gridSize; i++)
            {
                for (var j:int = 0; j < gridSize; j++)
                {
                    grid = new MapGrid(i, j);
                    //grid.x = j * MapGrid.GRID_SIZE - i * MapGrid.GRID_SIZE + mapCol * MapGrid.GRID_SIZE;
                    //grid.y = i * MapGrid.HALF_SIZE + MapGrid.HALF_SIZE + j * MapGrid.HALF_SIZE - mapCol * MapGrid.HALF_SIZE;
                    grid.x = (j - i + mapCol) * MapGrid.GRID_SIZE;
                    grid.y = (i + j - mapCol + 1) * MapGrid.HALF_SIZE;
                    addChild(grid);
                }
            }
        }
        
        public function gridToPoint(row:int, col:int):Point
        {
            return new Point((col - row + mapCol) * MapGrid.GRID_SIZE, (row + col - mapCol + 1) * MapGrid.HALF_SIZE);
        }
        
        public function pointToGrid(x:int, y:int):Grid
        {
            // TODO: 计算
            return new Grid(0, 0);
        }
        
        /**
         * 地图覆盖行数
         */
        public function get mapRow():int
        {
            return _mapRow;
        }
        
        /**
         * 地图覆盖列数
         */
        public function get mapCol():int
        {
            return _mapCol;
        }
        
        /**
         * 格子边长 (行列)
         */
        public function get gridSize():int
        {
            return _mapRow + _mapCol;
        }
        
        /**
         * 地图宽
         */
        public function get mapWidth():int
        {
            return _mapWidth;
        }
        
        /**
         * 地图高
         */
        public function get mapHeight():int
        {
            return _mapHeight;
        }
    }
}