package pages
{
	import game.ui.DatePageUI;
	import morn.core.handlers.Handler;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class DatePage extends DatePageUI
	{
		private var today:Date;
		
		public function DatePage()
		{
			super();
			init();
		}
		
		private function init():void
		{
			today = new Date();
			// 当前年
			var thisYear:int = today.getFullYear();
			// 当前月
			var thisMonth:int = today.getMonth() + 1;
			
			// 选择年/月时设置日的数据
			cYear.selectHandler = new Handler(onSelect);
			cMonth.selectHandler = new Handler(onSelect);
			
			// 初始化年
			cYear.dataSource = getNumArr(1900, thisYear + 1);
			cYear.selectedLabel = thisYear.toString();
			
			// 初始化月
			cMonth.dataSource = getNumArr(1, 12);
			cMonth.selectedLabel = thisMonth.toString();
		}
		
		private function onSelect(index:int):void
		{
			var arrDate:Array, maxDay:int;
			var year:int = parseInt(cYear.selectedLabel);
			var month:int = parseInt(cMonth.selectedLabel);
			var day:int = parseInt(cDay.selectedLabel) || today.getDate();
			
			// 31 天的月份
			if ([1, 3, 5, 7, 8, 10, 12].indexOf(month) != -1)
			{
				maxDay = 31;
			}
			// 2月
			else if (month == 2)
			{
				// 闰年
				if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0)
				{
					maxDay = 29;
				}
				else
				{
					maxDay = 28;
				}
			}
			// 30 天的月份
			else
			{
				maxDay = 30;
			}
			
			// 设置日期
			cDay.dataSource = getNumArr(1, maxDay);
			
			// 判断当前选中日期是否大于当前月的最大日期
			if (day > maxDay)
			{
				cDay.selectedLabel = maxDay.toString();
			}
			else
			{
				cDay.selectedLabel = day.toString();
			}
		}
		
		/**
		 * 获取从 min 到 max 的整数数组
		 * @param	min
		 * @param	max
		 * @return
		 */
		private function getNumArr(min:int, max:int):Array
		{
			var result:Array = [];
			for (var i:int = min; i <= max; i++)
			{
				result.push(i);
			}
			return result;
		}
	
	}

}