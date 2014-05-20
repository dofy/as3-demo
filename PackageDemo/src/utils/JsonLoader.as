package utils 
{
    import flash.events.Event;
	import flash.events.EventDispatcher;
    import flash.events.HTTPStatusEvent;
	import flash.events.IEventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
	
	/**
     * ...
     * @author Seven Yu
     */
	[Event(name="complete", type="flash.events.Event")] 
    public class JsonLoader extends EventDispatcher 
    {
        private var ul:URLLoader;
        
        private var _data:Object;
        
        public function JsonLoader() 
        {
            ul = new URLLoader();
            ul.addEventListener(IOErrorEvent.IO_ERROR, onError);
            ul.addEventListener(Event.COMPLETE, onComplete);
            ul.addEventListener(HTTPStatusEvent.HTTP_STATUS, onStatus);
        }
        
        private function onStatus(e:HTTPStatusEvent):void 
        {
            trace(e);
        }
        
        private function onError(e:IOErrorEvent):void 
        {
            trace(e);
        }
        
        private function onComplete(e:Event):void 
        {
            _data = JSON.parse(e.target.data);
            
            dispatchEvent(e.clone());
        }
        
        public function load(url:String):void
        {
            ul.load(new URLRequest(url));
        }
        
        public function get data():Object 
        {
            return _data;
        }
        
    }

}