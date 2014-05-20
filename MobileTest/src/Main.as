package 
{
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
    import flash.geom.Rectangle;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
    import phpz.Assets;
    import phpz.Core;
    import starling.core.Starling;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
        private var mStarling:Starling;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			
			// new to AIR? please read *carefully* the readme.txt files!
            
            stage.addEventListener(Event.RESIZE, onResize);
            
            
            mStarling = new Starling(Core, stage);
            mStarling.start();
		}
        
        private function onResize(e:Event):void 
        {
            trace(stage.stageWidth, stage.stageHeight);
            mStarling.viewPort = new Rectangle(0, 0, stage.stageWidth, stage.stageHeight);
        }
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			NativeApplication.nativeApplication.exit();
		}
		
	}
	
}