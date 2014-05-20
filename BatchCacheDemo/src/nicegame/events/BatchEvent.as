package nicegame.events
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BatchEvent extends Event
    {
        
        public static const ONE_FAILED:String = 'oneFailed';
        public static const ONE_COMPLETE:String = 'oneComplete';
        public static const ALL_COMPLETE:String = 'allComplete';
        
        private var _url:String;
        
        public function BatchEvent(type:String, url:String = "", bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
            _url = url;
        }
        
        public override function clone():Event
        {
            return new BatchEvent(type, url, bubbles, cancelable);
        }
        
        public override function toString():String
        {
            return formatToString("BatchEvent", "url", "type", "bubbles", "cancelable", "eventPhase");
        }
        
        public function get url():String
        {
            return _url;
        }
    
    }

}