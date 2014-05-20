package managers
{
    import flash.events.TimerEvent;
    import flash.utils.Dictionary;
    import flash.utils.Timer;
    
    /**
     * 循环计时控制器
     * @author Seven Yu
     */
    public class TimerManager
    {
        static private const DELAY:int = 30;
        
        static private var _self:TimerManager;
        
        private var _speed:Number = 1;
        
        /**
         * 自动开始
         */
        public var autoStart:Boolean = true;
        
        private var timer:Timer;
        
        private var handlers:Dictionary;
        
        public function TimerManager(xx:XX = null)
        {
            if (xx == null)
            {
                throw new Error('Please use TimerManager.getInstance() method or TimerManager.manager attribute.');
            }
            
            timer = new Timer(DELAY);
            timer.addEventListener(TimerEvent.TIMER, onTimer);
            
            handlers = new Dictionary();
        }
        
        /**
         * 获取管理器单例
         * @return
         */
        static public function get manager():TimerManager
        {
            if (_self == null)
            {
                _self = new TimerManager(new XX);
            }
            return _self;
        }
        
        static public function getInstance():TimerManager
        {
            return manager;
        }
        
        /**
         * 注册方法
         * @param func 执行方法
         * @param rate 执行频率(rate 个单位时间)
         */
        public function addHandler(func:Function, rate:int = 1):void
        {
            handlers[func] = {'funcBody': func, 'rateNumber': rate};
            if (autoStart && !running)
            {
                timer.start();
            }
        }
        
        /**
         * 移除方法
         * @param func
         */
        public function removeHandler(func:Function):void
        {
            delete handlers[func];
        }
        
        /**
         * 开始
         */
        public function statr(now:Boolean = false):void
        {
            timer.start();
            now && onTimer(null);
        }
        
        /**
         * 停止
         */
        public function stop():void
        {
            timer.stop();
        }
        
        /**
         * 重置
         */
        public function reset():void
        {
            timer.reset();
        }
        
        /**
         * 是否正在运行
         */
        public function get running():Boolean
        {
            return timer.running;
        }
        
        public function get currentCount():int
        {
            return timer.currentCount;
        }
        
        private function onTimer(e:TimerEvent):void
        {
            for each (var obj:Object in handlers)
            {
                if (obj && timer.currentCount % obj['rateNumber'] == 0)
                {
                    obj['funcBody']();
                }
            }
        }
        
        public function set speed(value:Number):void
        {
            _speed = value <= 0 ? 1 : value;
            timer.delay = DELAY / value;
        }
        
        public function get speed():Number 
        {
            return _speed;
        }
    
    }

}

class XX
{
}