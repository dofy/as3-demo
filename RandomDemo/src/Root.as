package  
{
	import starling.display.Sprite;
    import starling.events.EnterFrameEvent;
    import starling.events.Event;
    import ui.Ball;
    import ui.BallOne;
    import ui.BallThree;
    import ui.BallTwo;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Root extends Sprite 
    {
        
        private var balls:Vector.<Ball>;
        
        public function Root() 
        {
            super();
            if (stage)
                init();
            else
                addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // entry point
			
            addEventListener(EnterFrameEvent.ENTER_FRAME, onFrame);
            
            balls = new Vector.<Ball>;
            
            for (var i:int = 0; i < 100; i++)
            {
                balls.push(addChild(new BallOne()) as Ball);
                balls.push(addChild(new BallTwo()) as Ball);
                balls.push(addChild(new BallThree()) as Ball);
            }
        }
        
        private function onFrame(e:EnterFrameEvent):void
        {
            for (var i:int = 0, l:int = balls.length; i < l; i++)
            {
                balls[i].x += balls[i].xSpeed;
                balls[i].y += balls[i].ySpeed;
                
                if (balls[i].x < 0)
                {
                    balls[i].x = 0;
                    balls[i].negateXSpeed();
                }
                else if (balls[i].x > stage.stageWidth - balls[i].width)
                {
                    balls[i].x = stage.stageWidth - balls[i].width
                    balls[i].negateXSpeed();
                }
                
                if (balls[i].y < 0)
                {
                    balls[i].y = 0;
                    balls[i].negateYSpeed();
                }
                else if (balls[i].y > stage.stageHeight - balls[i].height)
                {
                    balls[i].y = stage.stageHeight - balls[i].height
                    balls[i].negateYSpeed();
                }
            }
        }
        
    }

}