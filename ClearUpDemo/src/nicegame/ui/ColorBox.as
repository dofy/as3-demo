package nicegame.ui
{
	import flash.display.Graphics;
	import flash.display.Shape;
	import nicegame.utils.Colors;
	import nicegame.vo.Position;
	
	/**
	 * 绘制方块
	 * @author Seven Yu
	 */
	public class ColorBox extends Shape
	{
		
		// 方块大小
		public static const SIZE:int = 30;
		// 圆角
		private const ELLIPSE:int = 0;
		// 方块行列
		public var pos:Position;
		
		private var _color:uint = 0;
		private var g:Graphics;
		
		public function ColorBox()
		{
			g = this.graphics;
			_color = Colors.randColor;
			draw();
		}
		
		/**
		 * 绘制
		 */
		private function draw():void
		{
			g.clear();
			g.beginFill(color);
			g.drawRoundRect(0, 0, SIZE, SIZE, ELLIPSE);
			g.endFill();
		}
		
		public function get color():uint
		{
			return _color;
		}
		
		public function get row():int
		{
			return pos ? pos.row : -1;
		}
		
		public function get col():int
		{
			return pos ? pos.col : -1;
		}
	
	}

}