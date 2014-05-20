package nicegame.util
{
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class OneLoader extends URLLoader
    {
        
        private var _url:String;
        
        private var progressCallback:Function;
        private var completeCallback:Function;
        private var errorCallback:Function;
        
        public function OneLoader(url:String = null, dataFormat:String = 'text', onProgress:Function = null, onComplete:Function = null, onError:Function = null)
        {
            super(new URLRequest(url));
            
            this._url = url;
            
            this.dataFormat = dataFormat;
            
            this.progressCallback = onProgress;
            this.completeCallback = onComplete;
            this.errorCallback = onError;
            
            this.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            this.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            this.addEventListener(Event.COMPLETE, completeHandler);
        }
        
        public function start():void
        {
            super.load(new URLRequest(url));
        }
        
        public function set onProgress(value:Function):void
        {
            this.progressCallback = value;
        }
        
        public function set onComplete(value:Function):void
        {
            this.completeCallback = value;
        }
        
        public function set onError(value:Function):void
        {
            this.errorCallback = value;
        }
        
        public function get url():String
        {
            return _url;
        }
        
        public function set url(value:String):void
        {
            _url = value;
        }
        
        private function progressHandler(e:ProgressEvent):void
        {
            progressCallback && progressCallback(e.clone());
        }
        
        private function completeHandler(e:Event):void
        {
            removeEvents();
            completeCallback && completeCallback(e);
        }
        
        private function errorHandler(e:IOErrorEvent):void
        {
            removeEvents();
            errorCallback && errorCallback(e.clone());
        }
        
        private function removeEvents():void
        {
            this.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
            this.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            this.removeEventListener(Event.COMPLETE, completeHandler);
        }
    
    }

}