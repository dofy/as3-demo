package nicegame.events
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class LoaderEvent extends Event 
    {
        
        public static const LOADED:String = 'loaded';
        
        private var _url:String;
        
        public function LoaderEvent(url:String, type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
        { 
            super(type, bubbles, cancelable);
            _url = url;
        } 
        
        public override function clone():Event 
        { 
            return new LoaderEvent(_url, type, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("LoaderEvent", "url", "type", "bubbles", "cancelable", "eventPhase"); 
        }
        
        public function get url():String 
        {
            return _url;
        }
        
    }
    
}