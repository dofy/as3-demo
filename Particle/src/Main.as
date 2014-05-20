package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import ui.Ball;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        private var ball:Ball;
        
        public function Main():void
        {
            if (stage)
                init();
            else
                addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // entry point
            
            addEventListener(Event.ENTER_FRAME, onFrame);
            
            ball = new Ball();
            addChild(ball);
            
            var d:Date;
            d = new Date(2014, 5, 1);
            trace(d);
            d = new Date('05/01/2014');
            trace(d);
        }
        
        private function onFrame(e:Event):void
        {
            ball.x = mouseX;
            ball.y = mouseY;
        }
    
    }

}