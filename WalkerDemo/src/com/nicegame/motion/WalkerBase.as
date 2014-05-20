package com.nicegame.motion
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.net.URLRequest;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.utils.Timer;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class WalkerBase extends Sprite
    {
        // 方向总数
        private const DIR_LENGTH:int = 8;
        // 每个方向的帧数
        private const FRAME_LENGTH:int = 8;
        
        // 没帧图片宽高
        private const FRAME_WIDTH:int = 114;
        private const FRAME_HEIGHT:int = 96;
        
        // 90度速度 (x, y 坐标)
        private const SPEED1:int = 10;
        // 45度速度 (x, y 坐标)
        private const SPEED2:int = 7;
        
        // 行走帧速
        private const DELAY_WALK:int = 50;
        // 奔跑帧速
        private const DELAY_RUN:int = 25;
        
        // 当前方向
        private var _dir:int;
        
        // 显示人物的 Bitmap
        private var _bitmap:Bitmap;
        
        // 保存图片序列帧的数组
        private var arrImage:Vector.<Vector.<BitmapData>>;
        
        // 当前帧
        private var _frameIndex:int;
        
        // 行走计时器
        private var walkTimer:Timer;
        // 奔跑计时器
        private var runTimer:Timer;
        
        // 是否已初始化
        private var _isInit:Boolean = false;
        
        /**
         * 行走基类
         * @param image     素材图片地址
         */
        public function WalkerBase(image:String = '')
        {
            super();
            
            init();
            loadImage(image);
        }
        
        /**
         * 初始化
         */
        private function init():void
        {
            _dir = Dir.DIR_DOWN;
            _frameIndex = 0;
            
            walkTimer = new Timer(DELAY_WALK);
            runTimer = new Timer(DELAY_RUN);
            
            walkTimer.addEventListener(TimerEvent.TIMER, timerHandler);
            runTimer.addEventListener(TimerEvent.TIMER, timerHandler);
            
            _bitmap = new Bitmap();
            _bitmap.x = -FRAME_WIDTH / 2;
            _bitmap.y = -FRAME_HEIGHT + 10;
            addChild(_bitmap);
            
            // test
            this.graphics.lineStyle(1, 0xcccccc);
            this.graphics.moveTo(-40, 0);
            this.graphics.lineTo(40, 0);
            this.graphics.lineTo(0, -20);
            this.graphics.lineTo(-40, 0);
            this.graphics.lineTo(0, 20);
            this.graphics.lineTo(40, 0);
            this.graphics.moveTo(0, -20);
            this.graphics.lineTo(0, 20);
        }
        
        private function loadImage(image:String):void
        {
            var loader:Loader = new Loader();
            loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
            
            loader.load(new URLRequest(image));
        }
        
        private function errorHandler(e:IOErrorEvent):void
        {
            _isInit = false;
            
            var errText:TextField = new TextField();
            errText.autoSize = TextFieldAutoSize.LEFT;
            errText.selectable = false;
            errText.defaultTextFormat = new TextFormat('consolas', 14, 0xff0000);
            errText.text = 'Error...';
            addChild(errText);
        }
        
        private function completeHandler(e:Event):void
        {
            _isInit = true;
            
            var img:BitmapData = (e.target.content as Bitmap).bitmapData;
            
            arrImage = new Vector.<Vector.<BitmapData>>;
            
            for (var i:int = 0; i < DIR_LENGTH; i++)
            {
                var frames:Vector.<BitmapData> = new Vector.<BitmapData>;
                for (var j:int = 0; j < FRAME_LENGTH; j++)
                {
                    var imgFrame:BitmapData = new BitmapData(FRAME_WIDTH, FRAME_HEIGHT);
                    imgFrame.copyPixels(img, new Rectangle(j * FRAME_WIDTH, i * FRAME_HEIGHT, FRAME_WIDTH, FRAME_HEIGHT), new Point(0, 0));
                    frames.push(imgFrame);
                }
                arrImage.push(frames);
            }
            
            img.dispose();
            
            render();
        }
        
        /**
         * 循环执行
         * @param e
         */
        private function timerHandler(e:TimerEvent):void
        {
            _frameIndex++;
            if (_frameIndex >= FRAME_LENGTH)
            {
                _frameIndex = 0;
            }
            render();
            move();
        }
        
        /**
         * 绘制图形
         */
        private function render():void
        {
            _bitmap.bitmapData = arrImage[_dir][_frameIndex];
        }
        
        /**
         * 按方向移动
         */
        private function move():void
        {
            switch (_dir)
            {
                case Dir.DIR_UP: 
                    this.y -= SPEED1;
                    break;
                case Dir.DIR_RIGHT: 
                    this.x += SPEED1;
                    break;
                case Dir.DIR_DOWN: 
                    this.y += SPEED1;
                    break;
                case Dir.DIR_LEFT: 
                    this.x -= SPEED1;
                    break;
                case Dir.DIR_UP_RIGHT: 
                    this.y -= SPEED2;
                    this.x += SPEED2;
                    break;
                case Dir.DIR_UP_LEFT: 
                    this.y -= SPEED2;
                    this.x -= SPEED2;
                    break;
                case Dir.DIR_DOWN_RIGHT: 
                    this.y += SPEED2;
                    this.x += SPEED2;
                    break;
                case Dir.DIR_DOWN_LEFT: 
                    this.y += SPEED2;
                    this.x -= SPEED2;
                    break;
                default: 
                    // nothing...
                    break;
            }
            
            if (this.x < 0)
            {
                this.x = stage.stageWidth;
            }
            else if (this.x > stage.stageWidth)
            {
                this.x = 0;
            }
            
            if (this.y < 0)
            {
                this.y = stage.stageHeight;
            }
            else if (this.y > stage.stageHeight)
            {
                this.y = 0;
            }
        }
        
        /**
         * 停止
         */
        public function stop():void
        {
            walkTimer.stop();
            runTimer.stop();
        }
        
        /**
         * 行走
         * @param dir   方向
         */
        public function walk(dir:uint):void
        {
            _dir = dir;
            
            if (runTimer.running)
            {
                runTimer.stop();
            }
            if (!walkTimer.running)
            {
                
                walkTimer.start();
            }
        }
        
        /**
         * 奔跑
         * @param dir   方向
         */
        public function run(dir:uint):void
        {
            _dir = dir;
            
            if (!runTimer.running)
            {
                runTimer.start();
            }
            if (walkTimer.running)
            {
                walkTimer.stop();
            }
        }
    
    }

}