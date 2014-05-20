package demo 
{
	/**
     * ...
     * @author Seven Yu
     */
    public class Robot2 extends Robot 
    {
        
        private var _color:uint;
        
        public function Robot2(color:uint) 
        {
            this.name = 'Robot2';
            this._color = color;
        }
        
        public function run():void
        {
            trace('I\'m running...');
        }
        
        public function get color():uint 
        {
            return _color;
        }
        
        public function hide():void
        {
            trace('You can not see me ;)');
        }
        
        public function show():void
        {
            trace('I am here! My color is ' + _color);
        }
        
    }

}