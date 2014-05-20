package utils
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Node
    {
        
        private var _row:int;
        private var _col:int;
        private var _parent:Node;
        private var _c:Number;
        private var _l:Number;
        
        public function Node(row:int, col:int, parent:Node, c:Number, l:Number)
        {
            this._row = row;
            this._col = col;
            this._parent = parent;
            this._c = c;
            this._l = l;
        }
        
        public function get f():Number
        {
            return _c + _l;
        }
        
        public function get row():int
        {
            return _row;
        }
        
        public function get col():int
        {
            return _col;
        }
        
        public function get parent():Node
        {
            return _parent;
        }
        
        public function get c():Number
        {
            return _c;
        }
    }
}