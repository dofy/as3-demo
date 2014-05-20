package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import morn.core.handlers.Handler;
	import pages.DatePage;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			App.init(this);
			App.loader.loadAssets(['assets/comp.swf'], new Handler(onLoaded));
		}
		
		private function onLoaded():void
		{
			addChild(new DatePage);
		}
		
	}
	
}