package ui
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.utils.Dictionary;
    import utils.Global;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Grid extends Sprite
    {
        
        private var rows:int;
        private var cols:int;
        
        private var mapData:Dictionary;
        private var _curCol:int;
        private var _curRow:int;
        
        // 是否与某个格子匹配
        private var _inOneItem:Boolean = false;
        
        public function Grid(rows:int, cols:int)
        {
            this.rows = rows;
            this.cols = cols;
            
            mapData = new Dictionary();
            
            createUI();
        }
        
        /**
         * 创建 UI
         */
        private function createUI():void
        {
            var item:GridItem;
            for (var i:int = 0; i < cols; i++)
            {
                for (var j:int = 0; j < rows; j++)
                {
                    item = new GridItem(Global.GRID_SIZE);
                    item.x = i * Global.GRID_SIZE;
                    item.y = j * Global.GRID_SIZE;
                    addChild(item);
                    mapData[i + '_' + j] = item;
                }
            }
        }
        
        /**
         * 开始检测
         */
        public function beginCheck():void
        {
            highLight();
            this.addEventListener(Event.ENTER_FRAME, onMove);
        }
        
        /**
         * 停止检测
         */
        public function endCheck():void
        {
            this.removeEventListener(Event.ENTER_FRAME, onMove);
            mapData[_curCol + '_' + _curRow].reset();
        }
        
        /**
         * 检测逻辑
         * @param e
         */
        private function onMove(e:Event):void
        {
            var col:int, row:int;
            
            // 技术鼠标位置对应的行列
            col = Math.floor(mouseX / Global.GRID_SIZE);
            row = Math.floor(mouseY / Global.GRID_SIZE);
            
            // 如果超出行列范围
            if (col < 0 || col >= cols || row < 0 || row >= rows)
            {
                _inOneItem = false;
                reset();
                return;
            }
            
            // 如果不是当前高亮的行列，高亮之（效率优化)
            if (col != _curCol || row != _curRow)
            {
                _inOneItem = true;
                reset();
                _curCol = col;
                _curRow = row;
                highLight();
            }
        }
        
        /**
         * 重置当前块
         */
        private function reset():void
        {
            mapData[_curCol + '_' + _curRow].reset();
        }
        
        /**
         * 高亮当前块
         */
        private function highLight():void
        {
            // 高亮
            mapData[_curCol + '_' + _curRow].highLight();
            // 重置层级
            addChildAt(mapData[_curCol + '_' + _curRow], numChildren - 1);
        }
        
        /**
         * 匹配的列
         */
        public function get curCol():int
        {
            return _curCol;
        }
        
        /**
         * 匹配的行
         */
        public function get curRow():int
        {
            return _curRow;
        }
        
        /**
         * 是否匹配
         */
        public function get inOneItem():Boolean
        {
            return _inOneItem;
        }
    
    }

}