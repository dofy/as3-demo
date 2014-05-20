package
{
    import events.BallEvent;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.setTimeout;
    import ui.Ball;
    import ui.MyButton;
    import ui.MyText;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var btn:MyButton;
        private var txt:MyText;
        
        private var balls:Array = [];
        
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
            
            btn = new MyButton('run');
            addChild(btn);
            btn.addEventListener(MouseEvent.CLICK, clickHandler);
            
            txt = new MyText('');
            addChild(txt);
            txt.x = 150;
            txt.y = 10;
            
            for (var i:int = 0; i < 10; i++)
            {
                var ball:Ball = new Ball(i, 700);
                addChild(ball);
                placeBall(i, ball);
                ball.addEventListener(BallEvent.COMPLETE, onComplete);
                ball.addEventListener(MouseEvent.CLICK, ballClickHandler);
                balls.push(ball);
            }
        }
        
        private function ballClickHandler(e:MouseEvent):void
        {
            txt.text = 'Speed: ' + (e.currentTarget as Ball).speed;
        }
        
        private var index:int = 1;
        
        private function onComplete(e:BallEvent):void
        {
            var ball:Ball = e.currentTarget as Ball;
            trace(index++, ball.id, ball.speed);
            setTimeout(function(i:int, b:Ball):void
                {
                    b.y = 500;
                    b.x = i * 60;
                    if (i > 10)
                    {
                        btn.enable = true;
                    }
                }, 200, index, ball);
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            if (!btn.enable)
            {
                return;
            }
            btn.enable = false;
            index = 1;
            for (var i:int = 0; i < balls.length; i++)
            {
                placeBall(i, balls[i]);
                balls[i].run();
            }
        }
        
        private function placeBall(i:int, ball:Ball):void
        {
            ball.x = 30;
            ball.y = i * 45 + 70;
        }
    
    }

}