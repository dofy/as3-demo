package
{
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import nicegame.events.LoaderEvent;
	import nicegame.utils.MyLoader;
	
	public class Main extends MovieClip
	{
		
		public function Main()
		{
			// constructor code
			
			btnLoad.addEventListener(MouseEvent.CLICK, clickHandler);
			
			stage.addEventListener(Event.DEACTIVATE, onDeactivate);
		}
		
		private function onDeactivate(e:Event):void
		{
			trace(9999);
		}
		
		private function clickHandler(e:MouseEvent):void
		{
			var ml:MyLoader = new MyLoader(txtName.text);
			ml.addEventListener(LoaderEvent.LOADED, loadedHandler);
		}
		
		private function loadedHandler(e:LoaderEvent):void
		{
			var loader:Loader = new Loader();
			addChild(loader);
			loader.x = 10;
			loader.y = 50;
			loader.load(new URLRequest(e.url));
		}
	}

}
