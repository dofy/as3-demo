package nicegame.utils
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    import nicegame.events.LoaderEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MyLoader extends EventDispatcher
    {
        
        public function MyLoader(name:String)
        {
            var ul:URLLoader = new URLLoader();
            var ur:URLRequest = new URLRequest('http://labs.phpz.org/face-kit/api.php');
            var uv:URLVariables = new URLVariables();
            
            uv.name = name;
            uv.format = 'json';
            
            ur.data = uv;
            
            ul.addEventListener(Event.COMPLETE, loadedHandler);
            ul.load(ur);
        }
        
        private function loadedHandler(e:Event):void
        {
            var json:Object = JSON.parse(e.target.data);
            dispatchEvent(new LoaderEvent(json.url, LoaderEvent.LOADED));
        }
    
    }

}