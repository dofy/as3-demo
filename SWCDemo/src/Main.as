package 
{
    import assets.Ball;
    import com.nicegame.assets.Rect;
    import fl.controls.Button;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
            
            var lbl:Rect = new Rect();
            lbl.label = 'test';
            addChild(lbl);
            
            var btn:Button = new Button();
            btn.label = 'test button';
            
            addChild(btn).x = 200;
            
            var ball:Ball = new Ball();
            addChild(ball).y = 50;
		}
		
	}
	
}