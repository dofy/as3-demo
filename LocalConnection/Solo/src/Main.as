package
{
    import flash.display.Sprite;
    import flash.events.AsyncErrorEvent;
    import flash.events.StatusEvent;
    import flash.net.LocalConnection;
    import flash.utils.setTimeout;
    import ui.Ball;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var ball:Ball;
        private var lc:LocalConnection;
        
        public function Main():void
        {
            initUI();
            initLC();
            startSolo();
        }
        
        private function initUI():void
        {
            ball = new Ball();
            addChild(ball);
            
            ball.x = ball.y = 120;
        }
        
        private function initLC():void
        {
            lc = new LocalConnection();
            lc.client = this;
            lc.addEventListener(StatusEvent.STATUS, statusHandler);
            lc.addEventListener(AsyncErrorEvent.ASYNC_ERROR, errorHandler);
        }
        
        private function statusHandler(e:StatusEvent):void
        {
            trace(e);
        }
        
        private function errorHandler(e:AsyncErrorEvent):void
        {
            trace(e);
        }
        
        private function startSolo():void
        {
            ball.green();
            
            try
            {
                trace('try...');
                lc.connect('solo');
            }
            catch (e:ArgumentError)
            {
                trace('error...');
                lc.send('solo', 'stopSolo');
                setTimeout(startSolo, 1000);
            }
        }
        
        public function stopSolo():void
        {
            trace('stop...');
            lc.close();
            ball.red();
        }
    
    }

}