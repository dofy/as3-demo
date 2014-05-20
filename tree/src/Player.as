package  
{
    import flash.display.Loader;
    import flash.display.LoaderInfo;
    import flash.display.MovieClip;
	import flash.display.Sprite;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
	
	/**
     * 播放器类
     */
    public class Player extends Sprite 
    {
        
        private var swf:MovieClip;
        
        private var uiBox:Sprite;
        
        private var title:TextField;
        
        private var pgBar:ProgressBar;
        
        private var url:String;
        
        public function Player() 
        {
            initUI();
        }
        
        /**
         * 初始化 UI
         */
        private function initUI():void 
        {
            // 控制台容器
            uiBox = new Sprite();
            addChild(uiBox);
            
            // 视频标题
            title = new TextField();
            title.selectable = false;
            title.autoSize = TextFieldAutoSize.LEFT;
            title.defaultTextFormat = new TextFormat('consolas', 14, 0x999999);
            uiBox.addChild(title);
            
            // 进度条
            pgBar = new ProgressBar();
            uiBox.addChild(pgBar);
            pgBar.y = 390;
        }
        
        private function onFrame(e:Event):void 
        {
            // 显示影片进度
            trace(swf.currentFrame, swf.totalFrames);
            pgBar.progress = swf.currentFrame / swf.totalFrames;
            if (swf.currentFrame == swf.totalFrames)
            {
                stopSwf();
            }
        }
        
        /**
         * 播放影片
         * @param title     影片标题
         * @param url       影片地址
         */
        public function play(title:String, url:String):void
        {
            // 同一个视频直接返回
            if (title == this.title.text && url == this.url)
            {
                return;
            }
            
            this.title.text = title;
            this.url = url;
            
            // 加载视频
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoaded);
            loader.load(new URLRequest(url));
        }
        
        private function onLoaded(e:Event):void 
        {
            // 停止正在播放的视频
            if (swf != null)
            {
                stopSwf();
            }
            
            // 开始播放新视频
            swf = (e.target as LoaderInfo).content as MovieClip;
            addChildAt(swf, 0);
            swf.gotoAndPlay(1);
            swf.addEventListener(Event.ENTER_FRAME, onFrame);
        }
        
        /**
         * 移除视频
         */
        private function stopSwf():void
        {
            swf.stop();
            swf.removeEventListener(Event.ENTER_FRAME, onFrame);
            removeChild(swf);
            swf = null;
        }
        
    }

}