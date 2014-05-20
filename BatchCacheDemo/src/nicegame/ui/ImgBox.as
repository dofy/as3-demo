package nicegame.ui
{
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.utils.ByteArray;
    import flash.utils.Timer;
    import nicegame.util.MemCache;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class ImgBox extends Sprite
    {
        
        private var urls:Array = [];
        
        private var timer:Timer;
        
        private var index:int = -1;
        
        private var img:Loader;
        
        public function ImgBox()
        {
            super();
        }
        
        public function addImg(url:String):void
        {
            urls.push(url);
        }
        
        public function show():void
        {
            if (timer == null)
            {
                timer = new Timer(2000);
                timer.addEventListener(TimerEvent.TIMER, showNext);
                
                img = new Loader();
                addChild(img);
                
                //img.contentLoaderInfo.addEventListener(Event.COMPLETE, resizeHandler);
            }
            
            timer.start();
            showNext(null);
        }
        
        private function resizeHandler(e:Event):void
        {
            img.x = stage.stageWidth - img.width >> 1;
            img.y = stage.stageHeight - img.height >> 1;
        }
        
        private function showNext(e:TimerEvent):void
        {
            if (++index == urls.length)
            {
                index = 0;
            }
            
            trace(index);
            img.loadBytes(MemCache.getCache(urls[index]));
        }
    
    }

}