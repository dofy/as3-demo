package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.net.URLLoaderDataFormat;
    import nicegame.events.BatchEvent;
    import nicegame.ui.ImgBox;
    import nicegame.util.BatchLoader;
    import nicegame.util.OneLoader;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var imgBox:ImgBox;
        
        public function Main():void
        {
            var configLoader:OneLoader = new OneLoader('assets/config.json');
            configLoader.onComplete = completeHandler;
            
            imgBox = new ImgBox();
            addChild(imgBox);
        }
        
        private function completeHandler(evt:Event):void
        {
            var imgs:Array = JSON.parse(evt.target.data).imgs;
            for each (var img:String in imgs)
            {
                BatchLoader.bot.pushURL(img, URLLoaderDataFormat.BINARY);
            }
            //BatchLoader.bot.addEventListener(BatchEvent.ONE_FAILED, failedHandler);
            //BatchLoader.bot.addEventListener(ProgressEvent.PROGRESS, progressHandler);
            BatchLoader.bot.addEventListener(BatchEvent.ONE_COMPLETE, oneCompleteHandler);
            BatchLoader.bot.addEventListener(BatchEvent.ALL_COMPLETE, allCompleteHandler);
            BatchLoader.bot.start();
        }
        
        private function progressHandler(e:ProgressEvent):void 
        {
            trace('PROGRESS:', e.bytesLoaded, e.bytesTotal);
        }
        
        private function failedHandler(e:BatchEvent):void
        {
            trace('FAILED', e.url);
        }
        
        private function oneCompleteHandler(e:BatchEvent):void
        {
            trace('ONE_COMPLETE', e.url);
            imgBox.addImg(e.url);
        }
        
        private function allCompleteHandler(e:BatchEvent):void
        {
            trace('ALL_COMPLETE');
            imgBox.show();
        }
    
    }

}