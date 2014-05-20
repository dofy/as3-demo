package core
{
    import configs.UIConfig;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import ui.Background;
    import ui.Grid;
    import ui.groups.*;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Game extends Sprite
    {
        
        private var _rows:int;
        private var _cols:int;
        
        private var midCol:int;
        
        private var grids:Vector.<Vector.<Grid>>;
        
        private var curGroup:IGroup;
        private var nextGroup:IGroup;
        private var curRow:int;
        private var curCol:int;
        
        public function Game(rows:int, cols:int)
        {
            _rows = rows;
            _cols = cols;
            
            midCol = Math.floor((cols - UIConfig.GROUP_MAX_SIZE / 2) / 2);
            
            initUI();
            initData();
            
            //test();
            GroupFactory.useExpand = true;
            start();
        }
        
        private function initUI():void
        {
            addChild(new Background(rows, cols));
        }
        
        private function initData():void
        {
            grids = new Vector.<Vector.<Grid>>;
            
            for (var i:int = 0, line:Vector.<Grid>; i < rows; i++)
            {
                line = new Vector.<Grid>;
                for (var j:int = 0, grid:Grid; j < cols; j++)
                {
                    grid = new Grid();
                    grid.x = j * UIConfig.GRID_SIZE;
                    grid.y = i * UIConfig.GRID_SIZE;
                    addChild(grid);
                    
                    line.push(grid);
                }
                grids.push(line);
            }
        }
        
        private function drawGroup(row:int, col:int, group:IGroup, fill:Boolean = true):void
        {
            var cData:Array = group.currentData;
            var cGrid:Grid;
            for (var i:int = 0; i < UIConfig.GROUP_MAX_SIZE; i++)
            {
                for (var j:int = 0; j < UIConfig.GROUP_MAX_SIZE; j++)
                {
                    if (row + i < 0 || row + i >= rows || col + j < 0 || col + j >= cols)
                        continue;
                    
                    cGrid = grids[row + i][col + j];
                    if (cData[i][j] == 1)
                    {
                        fill ? cGrid.fill(group.groupColor) : cGrid.empty();
                    }
                    else
                    {
                        fill ? cGrid.fill(0xffffff) : cGrid.empty();
                    }
                }
            }
        }
        
        private function clearLine(row:int):void
        {
            for (var i:int = 0; i < cols; i++)
            {
                grids[row][i].empty();
            }
        }
        
        public function start():void
        {
            curGroup && drawGroup(curRow, curCol, curGroup, false);
            getOneGroup();
        }
        
        public function whirl():void
        {
            if (curGroup)
            {
                drawGroup(curRow, curCol, curGroup, false);
                curGroup.nextMode();
                // check down
                if (curRow + UIConfig.GROUP_MAX_SIZE - curGroup.maxRow > rows)
                {
                    curGroup.prevMode();
                }
                drawGroup(curRow, curCol, curGroup);
                move(0, 0);
            }
        }
        
        public function move(rowOffset:int, colOffset:int):void
        {
            if (curGroup)
            {
                drawGroup(curRow, curCol, curGroup, false);
                //curGroup.nextMode();
                curRow += rowOffset;
                curCol += colOffset;
                // check left
                if (curCol + curGroup.minCol < 0)
                {
                    curCol = curGroup.minCol;
                }
                // check right
                if (curCol + UIConfig.GROUP_MAX_SIZE - curGroup.maxCol > cols)
                {
                    curCol = cols - UIConfig.GROUP_MAX_SIZE + curGroup.maxCol;
                }
                // check down
                if (curRow + UIConfig.GROUP_MAX_SIZE - curGroup.maxRow > rows)
                {
                    curRow = rows - UIConfig.GROUP_MAX_SIZE + curGroup.maxRow;
                }
                // check draw
                // TODO
                drawGroup(curRow, curCol, curGroup);
            }
        }
        
        private function getOneGroup():void
        {
            curGroup = nextGroup || GroupFactory.randGroup(true);
            nextGroup = GroupFactory.randGroup(true);
            
            curRow = curGroup.minRow;
            curCol = midCol + curGroup.minCol;
            
            drawGroup(curRow, curCol, curGroup);
        }
        
        public function get rows():int
        {
            return _rows;
        }
        
        public function get cols():int
        {
            return _cols;
        }
        
        // =================
        // --- test code ---
        // =================
        private function test():void
        {
            GroupFactory.useExpand = true;
            
            for (var g:IGroup, i:int = 0; i < 5; i++)
            {
                for (var j:int = 0; j < 5; j++)
                {
                    g = GroupFactory.nextGroup(true);
                    drawGroup(i * 4, j * 4, g);
                    trace(g.groupName, g.minCol, g.minRow, g.maxCol, g.maxRow);
                }
            }
            
            this.addEventListener(MouseEvent.CLICK, function(evt:MouseEvent):void
                {
                    g.nextMode();
                    drawGroup(0, 0, g);
                    trace(g.groupName, g.minCol, g.maxCol, g.minRow, g.maxRow);
                });
        }
    }

}