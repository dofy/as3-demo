package ui.groups
{
    import configs.UIConfig;
    import flash.display.Graphics;
    import flash.display.Shape;
    import flash.utils.Dictionary;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Group extends Shape implements IGroup
    {
        
        protected var data:Array;
        
        protected var color:uint;
        
        protected var myName:String;
        
        protected var _currentMode:int;
        
        static private var _minCol:Dictionary;
        static private var _maxCol:Dictionary;
        static private var _minRow:Dictionary;
        static private var _maxRow:Dictionary;
        
        public function Group()
        {
            data = [];
            myName = '*';
            _currentMode = -1;
            
            _minCol = new Dictionary();
            _maxCol = new Dictionary();
            _minRow = new Dictionary();
            _maxRow = new Dictionary();
            
            initData();
            nextMode();
        }
        
        protected function initData():void
        {
            throw new Error('please init data...');
        }
        
        public function prevMode():void
        {
            if (--_currentMode < 0)
            {
                _currentMode = modeLength - 1;
            }
        }
        
        public function nextMode():void
        {
            if (++_currentMode >= modeLength)
            {
                _currentMode = 0;
            }
        
            //drawMode();
        }
        
        public function randMode():void
        {
            _currentMode = Math.floor(Math.random() * modeLength);
        
            //drawMode();
        }
        
        public function drawMode():void
        {
            var g:Graphics = this.graphics;
            var curData:Array = data[_currentMode];
            
            g.clear();
            g.lineStyle(UIConfig.LINE_WEIGHT, UIConfig.COLOR_LINE);
            for (var i:int = 0, r:int = curData.length, line:Array; i < r; i++)
            {
                line = curData[i];
                for (var j:int = 0, c:int = line.length; j < c; j++)
                {
                    if (line[j] == 1)
                    {
                        g.beginFill(color);
                        g.drawRoundRect(j * UIConfig.GRID_SIZE, i * UIConfig.GRID_SIZE, UIConfig.GRID_SIZE, UIConfig.GRID_SIZE, UIConfig.ELLIPSE);
                        g.endFill();
                    }
                }
            }
        }
        
        public function get modeLength():int
        {
            return data.length;
        }
        
        public function get currentMode():int
        {
            return _currentMode;
        }
        
        public function get currentData():Array
        {
            return data[_currentMode] || [];
        }
        
        public function get groupColor():uint
        {
            return color;
        }
        
        public function get minCol():int
        {
            if (_minCol[currentMode])
                return _minCol[currentMode];
            
            var items:Array;
            for (var j:int = 0, c:int = currentData[0].length; j < c; j++)
            {
                for (var i:int = 0, r:int = currentData.length; i < r; i++)
                {
                    items = currentData[i];
                    if (items[j] == 1)
                    {
                        _minCol[currentMode] = -j;
                        j = c, i = r; // break all
                    }
                }
            }
            return _minCol[currentMode];
        }
        
        public function get maxCol():int
        {
            if (_maxCol[currentMode])
                return _maxCol[currentMode];
            
            var items:Array;
            for (var j:int = 0, c:int = currentData[0].length; j < c; j++)
            {
                for (var i:int = 0, r:int = currentData.length; i < r; i++)
                {
                    items = currentData[i];
                    if (items[c - j - 1] == 1)
                    {
                        _maxCol[currentMode] = j;
                        j = c, i = r; // break all
                    }
                }
            }
            return _maxCol[currentMode];
        }
        
        public function get minRow():int
        {
            if (_minRow[currentMode])
                return _minRow[currentMode];
            
            var items:Array;
            for (var i:int = 0, r:int = currentData.length; i < r; i++)
            {
                items = currentData[i];
                for (var j:int = 0, c:int = items.length; j < c; j++)
                {
                    if (items[j] == 1)
                    {
                        _minRow[currentMode] = -i;
                        j = c, i = r; // break all
                    }
                }
            }
            return _minRow[currentMode];
        }
        
        public function get maxRow():int
        {
            if (_maxRow[currentMode])
                return _maxRow[currentMode];
            
            var items:Array;
            for (var i:int = 0, r:int = currentData.length; i < r; i++)
            {
                items = currentData[r - i - 1];
                for (var j:int = 0, c:int = items.length; j < c; j++)
                {
                    if (items[j] == 1)
                    {
                        _maxRow[currentMode] = i;
                        j = c, i = r; // break all
                    }
                }
            }
            return _maxRow[currentMode];
        }
        
        public function get groupName():String
        {
            return myName;
        }
    
    }

}