package 
{
	import flash.display.Sprite;
	import flash.events.Event;
    import utils.Draw;
	
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
            
            Draw.draw3(graphics, 300, 300, 100);
		}
		
	}
	
}