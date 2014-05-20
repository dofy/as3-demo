package phpz
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Loader;
    import flash.events.Event;
    import flash.filesystem.File;
    import starling.display.Button;
    import starling.display.Image;
    import starling.display.Sprite;
    import starling.events.Touch;
    import starling.events.TouchEvent;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.utils.AssetManager;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Core extends Sprite
    {
        //private var am:AssetManager;
        
        private var btn:Button;
        private var logo:Image;
        private var debug:TextField;
        private var f:File;
        
        public function Core()
        {
            // 初始化资源管理器
            //am = new AssetManager(0.8);
            // 加载资源队列
            //am.enqueue(File.applicationDirectory.resolvePath('assets'));
            // 开始加载
            //am.loadQueue(onProgress);
            
            // 方式一
            //Assets.getInstance().load();
            //Assets.getInstance().addEventListener(Event.COMPLETE, init);
            
            // 方式二
            Assets2.instance.load(init);
        }
        
        //private function onProgress(ratio:Number):void
        //{
            //if (ratio == 1)
            //{
                //init();
            //}
        //}
        
        private function init():void
        //private function init(e:Event):void
        {
            debug = new TextField(500, 30, 'debug...', 'Consolas', 16);
            addChild(debug);
            debug.y = stage.stageHeight - debug.height - 300;
            
            btn = new Button(Assets2.instance.getTexture('btnUp'), 'Start', Assets2.instance.getTexture('btnDown'));
            addChild(btn);
            btn.y = 200;
            //btn.enabled = false;
            btn.addEventListener(starling.events.Event.TRIGGERED, onClick);
            
            logo = new Image(Assets2.instance.getTexture('logo'));
            addChild(logo);
            
            debug.text = stage.stageWidth + ',' + stage.stageHeight;
        }
        
        private function onClick(e:starling.events.Event):void
        {
            f = new File();
            f.addEventListener(flash.events.Event.SELECT, onSelect);
            f.addEventListener(flash.events.Event.OPEN, onOpen);
            f.addEventListener(flash.events.Event.COMPLETE, onComplete);
            f.browseForOpen('open');
        }
        
        private function onSelect(e:Event):void
        {
            trace('select');
            f.load();
        }
        
        private function onOpen(e:flash.events.Event):void
        {
            trace('open');
        }
        
        private function onComplete(e:flash.events.Event):void
        {
            trace('complete');
            var l:Loader = new Loader();
            l.loadBytes(f.data);
            l.contentLoaderInfo.addEventListener(Event.COMPLETE, function():void
                {
                    var bd:BitmapData = new BitmapData(l.width, l.height);
                    bd.draw(l);
                    
                    var t:Texture = Texture.fromBitmapData(bd);
                    var i:Image = new Image(t);
                    addChild(i);
                });
        }
        
        private function touchHandler(e:TouchEvent):void
        {
            var touch:Touch = e.getTouch(stage);
            switch (touch.phase)
            {
            
            }
        }
    
    }

}