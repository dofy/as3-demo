package 
{
    import comm.Global;
	import flash.display.Sprite;
	import flash.events.Event;
    import pages.Package;
    import utils.JsonLoader;
	
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
            
            Global.uid = '1';
            
            var jl:JsonLoader = new JsonLoader();
            jl.addEventListener(Event.COMPLETE, onComplete);
            jl.load('config/goods.json');
		}
        
        private function onComplete(e:Event):void 
        {
            Global.skills = (e.target as JsonLoader).data.skill;
            
            addChild(new Package());
        }
		
	}
	
}