package 
{
	import flash.display.Sprite;
	import flash.events.Event;
    import nicegame.demo.FacadeApp;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
            FacadeApp.getInstance().start(stage);
		}
		
	}
	
}