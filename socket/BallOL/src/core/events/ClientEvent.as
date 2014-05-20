package core.events 
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class ClientEvent extends Event 
    {
        
        public function ClientEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
        { 
            super(type, bubbles, cancelable);
            
        } 
        
        public override function clone():Event 
        { 
            return new ClientEvent(type, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("ClientEvent", "type", "bubbles", "cancelable", "eventPhase"); 
        }
        
    }
    
}