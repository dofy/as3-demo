package nicegame.utils
{
	
	/**
	 * 获取颜色
	 * @author Seven Yu
	 */
	public class Colors
	{
		
		public static const COLORS:Array = [0xfb1f4b, 0xfba31f, 0xfbfb55, 0x68f75a, 0x3ae8fb, 0x4188f4, 0xfb55d9, 0x8f0458];
		
		public static function get randColor():uint
		{
			var index:int = Math.round(Math.random() * (COLORS.length - 1));
			return COLORS[index];
		}
	
	}

}