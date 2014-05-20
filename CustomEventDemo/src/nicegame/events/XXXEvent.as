package nicegame.events 
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class XXXEvent extends Event 
    {
     
        private var _data:String;
        
        public function XXXEvent(data:String, type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
        { 
            super(type, bubbles, cancelable);
            _data = data;
        } 
        
        public override function clone():Event 
        { 
            return new XXXEvent(_data, type, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("XXXEvent", "data", "type", "bubbles", "cancelable", "eventPhase"); 
        }
        
        public function get data():String 
        {
            return _data;
        }
        
    }
    
}