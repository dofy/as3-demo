package events 
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BallEvent extends Event 
    {
        
        public static const COMPLETE:String = 'ccc';
        
        public function BallEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
        { 
            super(type, bubbles, cancelable);
            
        } 
        
        public override function clone():Event 
        { 
            return new BallEvent(type, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("BallEvent", "type", "bubbles", "cancelable", "eventPhase"); 
        }
        
    }
    
}