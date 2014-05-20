package
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.utils.Dictionary;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Dict extends EventDispatcher
    {
        
        private static var _dict:Dictionary;
        
        private static var _handler:Function;
        
        private static var _isInit:Boolean = false;
        
        static public function load(url:String, handler:Function = null):void
        {
            _dict = new Dictionary();
            
            _handler = handler;
            
            var ul:URLLoader = new URLLoader();
            var ur:URLRequest = new URLRequest(url);
            ul.addEventListener(IOErrorEvent.IO_ERROR, onError);
            ul.addEventListener(Event.COMPLETE, onComplete);
            ul.load(ur);
        }
        
        static private function onError(e:IOErrorEvent):void
        {
            trace(e);
        }
        
        static private function onComplete(e:Event):void
        {
            var dict:String = e.target.data;
            var list:Array = dict.split(',');
            for (var i:int = 0, l:int = list.length; i < l; i++)
            {
                var item:Array = list[i].split(' ');
                var key:String = item[0];
                var value:String = item[1];
                if (!_dict[key])
                {
                    _dict[key] = [];
                }
                _dict[key].push(value);
            }
            _isInit = true;
            _handler && _handler();
        }
        
        static public function get isInit():Boolean
        {
            return _isInit;
        }
        
        static public function set isInit(value:Boolean):void
        {
            _isInit = value;
        }
        
        static public function get dict():Dictionary
        {
            return _dict;
        }
    
    }

}