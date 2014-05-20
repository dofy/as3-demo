package 
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.ui.Multitouch;
    import flash.ui.MultitouchInputMode;
    import net.hires.debug.Stats;
    import org.phpz.demo.Game;
    import starling.core.Starling;
    import starling.utils.HAlign;
    import starling.utils.VAlign;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
        private var starling:Starling;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
            
			stage.addEventListener(Event.DEACTIVATE, deactivate);
            stage.addEventListener(Event.ACTIVATE, activate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			
			// new to AIR? please read *carefully* the readme.txt files!
            
            //addChild(new Stats());
            
            starling = new Starling(Game, stage);
            starling.showStats = true;
            starling.showStatsAt(HAlign.RIGHT, VAlign.BOTTOM, 3);
            starling.start();
            
		}
        
        private function activate(e:Event):void 
        {
            starling.start();
            
            
        }
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			//NativeApplication.nativeApplication.exit();
            starling.stop();
		}
		
	}
	
}