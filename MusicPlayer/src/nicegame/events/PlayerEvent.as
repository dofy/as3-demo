package nicegame.events
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class PlayerEvent extends Event
    {
        
        // 播放逻辑的事件
        public static const ID3:String = 'id3';
        public static const PLAY:String = 'play';
        public static const STOP:String = 'stop';
        public static const PAUSE:String = 'pause';
        public static const RESUME:String = 'resume';
        public static const PROGRESS:String = 'progress';
        
        public static const ERROR:String = 'error';
        
        public static const VOL_CHANGED:String = 'vol';
        public static const POS_CHANGED:String = 'pos';
        public static const COMPLETE:String = 'complete';
        
        // 播放列表的事件
        public static const NEXT:String = 'next';
        public static const PREV:String = 'prev';
        public static const PLAY_ONE:String = 'playOne';
        
        // 属性
        private var _data:*;
        
        public function PlayerEvent(type:String, data:* = null, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
            
            _data = data;
        }
        
        public override function clone():Event
        {
            return new PlayerEvent(type, bubbles, cancelable);
        }
        
        public override function toString():String
        {
            return formatToString("PlayerEvent", "type", "bubbles", "cancelable", "eventPhase");
        }
        
        public function get data():*
        {
            return _data;
        }
    
    }

}