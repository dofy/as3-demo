package org.phpz.utils
{
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Tools
	{
		
		private static var _localUid:int = 0;
		
        /**
         * 随机 ID
         */
		public static function get GlobalUid():String
		{
			return [new Date().getTime(), Math.round(Math.random() * 899999) + 100000].join('_');
		}
		
        /**
         * 数字顺序 ID
         */
		public static function get LocalUid():String
		{
			return _localUid++ + '';
		}
		
        /**
         * 格式化时间
         * @param date
         * @return
         */
		public static function formatDate(date:Date):String
		{
			var strDate:String = [date.getFullYear(), fixZero(date.getMonth() + 1), fixZero(date.getDate())].join('/');
			var strTime:String = [fixZero(date.getHours()), fixZero(date.getMinutes()), fixZero(date.getSeconds())].join(':');
			
			return [strDate, strTime].join(' ');
		}
		
        /**
         * 数字补零
         * @param num
         * @return
         */
		public static function fixZero(num:int):String
		{
			return num > 9 ? num.toString() : '0' + num;
		}
	
	}

}