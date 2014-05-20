package
{
	import flash.display.Sprite;
	import flash.external.ExternalInterface;
	import flash.text.TextField;
	
	import bwie.ui.MyBox;
	
	[SWF(width="400", height="300")]
	public class EIDemo extends Sprite
	{
		
		private var box:MyBox;
		
		public function EIDemo()
		{
			var result:int = ExternalInterface.call('jsfunc', 3, 4);
			ExternalInterface.addCallback('ttt', moveBox);
			
			var t:TextField=new TextField();
			addChild(t);
			t.text = result.toString();
			
			box=new MyBox();
			addChild(box);
			
		}
		
		private function moveBox(xOffset:int, yOffset:int):void
		{
			box.x += xOffset;
			box.y += yOffset;
		}
		
		private function test(endX:int, endY:int):String
		{
			graphics.lineStyle(1,0x008000);
			graphics.moveTo(0,0);
			graphics.lineTo(endX, endY);
			
			return 'ok';
		}
			
		
	}
}