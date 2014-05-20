package nicegame.vo
{
    
    /**
     * 自定义数据对象 (value object)
     * @author Seven Yu
     */
    public class InfoVO
    {
        
        public var index:int;
        private var _color:uint;
        public var x:Number;
        public var y:Number;
        
        public function InfoVO(color:uint)
        {
            _color = color;
        }
        
        public function toString():String
        {
            return '{' + ['index:' + index, 'color:' + color, 'x:' + x, 'y:' + y].join() + '}';
        }
        
        public function get color():uint 
        {
            return _color;
        }
    
    }

}