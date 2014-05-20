package 
{
	import flash.display.Sprite;
	import flash.events.Event;
    import flash.net.LocalConnection;
    import ui.Ball;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
        private var lc:LocalConnection;
        private var ball:Ball;
		
		public function Main():void 
		{
            initUI();
            initConnection();
		}
        
        private function initUI():void 
        {
            ball = new Ball();
            addChild(ball);
            ball.x = ball.y = 300;
        }
        
        private function initConnection():void 
        {
            lc = new LocalConnection();
            lc.connect('LCDemo');
            lc.client = this;
        }
        
        public function move(offsetX:int, offsetY:int):void
        {
            ball.x += offsetX;
            ball.y += offsetY;
        }
		
	}
	
}