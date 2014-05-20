package org.phpz.net
{
	import flash.net.Socket;
	
	/**
	 * Socket 客户端
	 * @author Seven Yu
	 */
	public class SocketClient
	{
		private var _uid:String;
		private var _socket:Socket;
		
        /**
         * 构建客户端
         * @param uid
         * @param socket
         */
		public function SocketClient(uid:String, socket:Socket)
		{
			_uid = uid;
			_socket = socket;
		}
		
		public function get uid():String
		{
			return _uid;
		}
		
		public function get socket():Socket
		{
			return _socket;
		}
	}

}