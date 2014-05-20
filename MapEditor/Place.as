package
{
    
    import flash.display.MovieClip;
    
    public class Place extends MovieClip implements IPlace
    {
        
        private var _type:int;
        
        public function Place(type:int = 1)
        {
            this.type = type;
        }
        
        public function get type():int
        {
            return _type;
        }
        
        public function set type(value:int):void
        {
            _type = Math.min(4, Math.max(0, value));
            this.gotoAndStop(_type + 1);
        }
        
        override public function toString():String
        {
            return String(_type);
        }
    
    }

}
