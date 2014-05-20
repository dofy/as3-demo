package nicegame.vo
{
	
	/**
	 * 行列 VO
	 * @author Seven Yu
	 */
	public class Position
	{
		
		public var col:int;
		public var row:int;
		
		/**
		 * 行列 VO
		 * @param	r
		 * @param	c
		 */
		public function Position(r:int = -1, c:int = -1)
		{
			row = r;
			col = c;
		}
	
	}

}