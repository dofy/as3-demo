package nicegame.util
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import nicegame.events.BatchEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BatchLoader extends EventDispatcher
    {
        
        private static var _self:BatchLoader;
        
        private var urls:Vector.<String>;
        private var formats:Vector.<String>;
        
        public function BatchLoader(x:X = null)
        {
            if (x == null)
            {
                throw new Error('please call BatchLoader.bot');
            }
            
            urls = new Vector.<String>;
            formats = new Vector.<String>;
        }
        
        public static function get bot():BatchLoader
        {
            if (_self == null)
            {
                _self = new BatchLoader(new X);
            }
            return _self;
        }
        
        public function pushURL(url:String, format:String = 'text'):void
        {
            var index:int = urls.indexOf(url);
            if (index === -1)
            {
                urls.push(url);
                formats.push(format);
            }
            else
            {
                formats[index] = format;
            }
        }
        
        public function start():void
        {
            loadNext();
        }
        
        private function loadNext():void
        {
            if (urls.length > 0)
            {
                var url:String = urls.shift();
                var format:String = formats.shift();
                
                var loader:OneLoader = new OneLoader(url, format, progressHandler, completeHandler, errorHandler);
                loader.start();
            }
            else
            {
                dispatchEvent(new BatchEvent(BatchEvent.ALL_COMPLETE));
            }
            
            function errorHandler(evt:IOErrorEvent):void
            {
                trace(evt);
                dispatchEvent(new BatchEvent(BatchEvent.ONE_FAILED, url));
                loadNext();
            }
            
            function progressHandler(evt:ProgressEvent):void
            {
                dispatchEvent(evt.clone());
            }
            
            function completeHandler(evt:Event):void
            {
                MemCache.setCache(url, evt.target.data);
                dispatchEvent(new BatchEvent(BatchEvent.ONE_COMPLETE, url));
                loadNext();
            }
        }
    
    }

}

class X
{
}