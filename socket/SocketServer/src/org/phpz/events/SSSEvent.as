package org.phpz.events
{
	import flash.events.Event;
	
	/**
	 * Seven Socket Server Event
	 * @author Seven Yu
	 */
	public class SSSEvent extends Event
	{
		
		public static const LISTEN:String = 'listen';
		public static const CLOSE:String = 'close';
		
        // 客户端连接到服务器
		public static const CLIENT_JOIN:String = 'client_join';
        // 客户端与服务器断开
		public static const CLIENT_QUIT:String = 'client_quit';
        // 客户端发送数据
		public static const CLIENT_DATA:String = 'client_data';
		
		private var _data:*;
		
		public function SSSEvent(type:String, data:* = null, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
			_data = data;
		}
		
		public override function clone():Event
		{
			return new SSSEvent(type, _data, bubbles, cancelable);
		}
		
		public override function toString():String
		{
			return formatToString("SSSEvent", "data", "type", "bubbles", "cancelable", "eventPhase");
		}
		
		public function get data():*
		{
			return _data;
		}
	
	}

}