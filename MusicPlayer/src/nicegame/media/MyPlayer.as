package nicegame.media
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.TimerEvent;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.media.SoundTransform;
    import flash.net.URLRequest;
    import flash.utils.Timer;
    import nicegame.events.PlayerEvent;
    
    /**
     * ....
     * @author Seven Yu
     */
    public class MyPlayer extends EventDispatcher
    {
        
        private var _vol:Number = 1;
        
        private var _pos:int;
        
        private var _url:String;
        
        private var _isPause:Boolean = true;
        
        private var proTimer:Timer;
        
        private var sound:Sound;
        private var soundChannel:SoundChannel;
        
        public function MyPlayer()
        {
        
        }
        
        override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeak:Boolean = false):void
        {
            super.addEventListener(type, listener, useCapture, priority, useWeak);
            if (type == PlayerEvent.PROGRESS)
            {
                if (!proTimer)
                {
                    proTimer = new Timer(200);
                    proTimer.addEventListener(TimerEvent.TIMER, onTimer);
                }
                proTimer.start();
            }
        }
        
        override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
        {
            super.removeEventListener(type, listener, useCapture);
            if (type == PlayerEvent.PROGRESS)
            {
                proTimer && proTimer.running && proTimer.stop();
            }
        }
        
        private function onTimer(e:TimerEvent):void
        {
            var pro:Number = soundChannel ? soundChannel.position / sound.length : 0;
            dispatchEvent(new PlayerEvent(PlayerEvent.PROGRESS, pro));
        }
        
        public function play(url:String):void
        {
            if (soundChannel)
            {
                soundChannel.stop();
            }
            
            _url = url;
            
            _isPause = false;
            
            sound = new Sound(new URLRequest(url));
            sound.addEventListener(Event.ID3, id3Handler);
            sound.addEventListener(IOErrorEvent.IO_ERROR, onError);
            
            soundChannel = new SoundChannel();
            pos = 0;
            
            dispatchEvent(new PlayerEvent(PlayerEvent.PLAY));
        }
        
        private function onError(e:IOErrorEvent):void
        {
            dispatchEvent(new PlayerEvent(PlayerEvent.ERROR, e.clone()));
        }
        
        private function onComplete(e:Event):void
        {
            dispatchEvent(new PlayerEvent(PlayerEvent.COMPLETE));
        }
        
        private function id3Handler(e:Event):void
        {
            dispatchEvent(new PlayerEvent(PlayerEvent.ID3, sound.id3));
        }
        
        public function pause():void
        {
            _pos = soundChannel.position;
            soundChannel.stop();
            
            _isPause = true;
            
            dispatchEvent(new PlayerEvent(PlayerEvent.PAUSE));
        }
        
        public function resume():void
        {
            _isPause = false;
            pos = _pos;
            dispatchEvent(new PlayerEvent(PlayerEvent.RESUME));
        }
        
        public function stop():void
        {
            soundChannel && soundChannel.stop();
            dispatchEvent(new PlayerEvent(PlayerEvent.STOP));
        }
        
        public function get pos():int
        {
            return soundChannel ? soundChannel.position : 0;
        }
        
        public function set pos(value:int):void
        {
            _pos = value;
            
            if (soundChannel && !_isPause)
            {
                soundChannel.stop();
                try
                {
                    soundChannel = sound.play(_pos, 0, new SoundTransform(_vol));
                }
                catch (e:Error)
                {
                    dispatchEvent(new PlayerEvent(PlayerEvent.ERROR, e));
                }
                soundChannel.addEventListener(Event.SOUND_COMPLETE, onComplete);
            }
            dispatchEvent(new PlayerEvent(PlayerEvent.POS_CHANGED, value));
        }
        
        public function get length():Number
        {
            return sound ? sound.length : 0;
        }
        
        public function get vol():Number
        {
            return _vol;
        }
        
        public function set vol(value:Number):void
        {
            _vol = value;
            
            if (_vol < 0)
            {
                _vol = 0;
            }
            
            if (_vol > 1)
            {
                _vol = 1;
            }
            
            soundChannel && (soundChannel.soundTransform = new SoundTransform(_vol));
            
            dispatchEvent(new PlayerEvent(PlayerEvent.VOL_CHANGED, _vol));
        }
        
        /**
         * 当前播放歌曲的路径
         */
        public function get url():String
        {
            return _url;
        }
        
        public function get isPause():Boolean
        {
            return _isPause;
        }
    
    }

}