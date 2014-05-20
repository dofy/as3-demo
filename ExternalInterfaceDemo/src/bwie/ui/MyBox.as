package bwie.ui
{
	import flash.display.Sprite;
	
	public class MyBox extends Sprite
	{
		public function MyBox()
		{
			super();
			graphics.beginFill(0xffcc00);
			graphics.drawCircle(0,0,30);
			graphics.endFill();
		}
	}
}