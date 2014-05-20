package nicegame.events
{
    import flash.events.Event;
    import nicegame.vo.InfoVO;
    
    public class MyEvent extends Event 
    {
        
        public static const MY_EVENT_TYPE:String = 'MyEvent_Type';
        
        private var _data:InfoVO;
        
        public function MyEvent(data:InfoVO, type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
        { 
            super(type, bubbles, cancelable);
            _data = data;
        } 
        
        public override function clone():Event 
        { 
            return new MyEvent(_data, type, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("MyEvent", "data", "type", "bubbles", "cancelable", "eventPhase"); 
        }
        
        public function get data():InfoVO 
        {
            return _data;
        }
        
    }
    
}