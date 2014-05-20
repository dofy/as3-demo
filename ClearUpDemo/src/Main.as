package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import nicegame.core.Game;
	import nicegame.ui.ColorBox;
	
	/**
	 * 消除游戏
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
			
			var game:Game = new Game();
			addChild(game);
			game.x = 50;
			game.y = 50;
		}
		
	}
	
}