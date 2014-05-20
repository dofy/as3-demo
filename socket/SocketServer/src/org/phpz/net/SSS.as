package org.phpz.net
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.ProgressEvent;
    import flash.events.ServerSocketConnectEvent;
    import flash.net.ServerSocket;
    import flash.net.Socket;
    import flash.utils.ByteArray;
    import flash.utils.Dictionary;
    import org.phpz.events.SSSEvent;
    import org.phpz.utils.Tools;
    
    /**
     * Seven Socket Server
     * @author Seven Yu
     */
    public class SSS extends EventDispatcher
    {
        
        public var policyServer:ServerSocket;
        public var server:ServerSocket;
        public var clients:Dictionary;
        
        private static var _self:SSS;
        
        public function SSS()
        {
            if (_self)
            {
                throw new Error('SSS.server');
            }
            
            policyServer = new ServerSocket();
            server = new ServerSocket();
            clients = new Dictionary();
        }
        
        public static function get server():SSS
        {
            if (_self == null)
            {
                _self = new SSS();
            }
            return _self;
        }
        
        public function bind(port:int = 0, host:String = '0.0.0.0'):void
        {
            if (server.bound)
            {
                server.close();
                server = new ServerSocket();
                dispatchEvent(new SSSEvent(SSSEvent.CLOSE));
            }
            
            if (policyServer.bound)
            {
                policyServer.close();
                policyServer = new ServerSocket;
            }
            
            server.bind(port, host);
            server.addEventListener(ServerSocketConnectEvent.CONNECT, connectHandler);
            server.listen();
            dispatchEvent(new SSSEvent(SSSEvent.LISTEN, host + ":" + port));
            
            policyServer.bind(843, host);
            policyServer.addEventListener(ServerSocketConnectEvent.CONNECT, policyConnectHandler);
            policyServer.listen();
        }
        
        /**
         * 返回策略文件 socket 连接
         * @param e
         */
        private function policyConnectHandler(e:ServerSocketConnectEvent):void
        {
            var socket:Socket = e.socket;
            if (socket != null && socket.connected)
                socket.addEventListener(ProgressEvent.SOCKET_DATA, policySocketDataHandler);
        
        }
        
        /**
         * 返回策略文件
         * @param e
         */
        private function policySocketDataHandler(e:ProgressEvent):void
        {
            if (socket && !socket.connected)
                return;
            var socket:Socket = Socket(e.currentTarget);
            
            var ba:ByteArray = new ByteArray();
            ba.writeUTFBytes('<cross-domain-policy>');
            ba.writeUTFBytes('<allow-access-from domain="*" to-ports="*" />');
            ba.writeUTFBytes('</cross-domain-policy>');
            ba.writeByte(0);
            ba.position = 0;
            
            socket.writeBytes(ba, 0, ba.bytesAvailable);
            socket.flush();
            socket.close();
        }
        
        /**
         * 客户端连接成功
         * @param e
         */
        private function connectHandler(e:ServerSocketConnectEvent):void
        {
            var client:SocketClient = new SocketClient(Tools.LocalUid, e.socket);
            
            trace('join', client.uid);
            
            clients[client.uid] = client;
            client.socket.addEventListener(Event.CLOSE, clientCloseHandler);
            client.socket.addEventListener(ProgressEvent.SOCKET_DATA, clientDataHandler);
            
            // 派发 JOIN 事件
            dispatchEvent(new SSSEvent(SSSEvent.CLIENT_JOIN, client));
        }
        
        /**
         * 客户端断开连接
         * @param e
         */
        private function clientCloseHandler(e:Event):void
        {
            var client:SocketClient = findClient(e.target as Socket);
            if (client)
            {
                trace('quit', client.uid);
                dispatchEvent(new SSSEvent(SSSEvent.CLIENT_QUIT, client.uid));
                delete clients[client.uid];
            }
        }
        
        /**
         * 客户端发送数据, 进行广播
         * @param e
         */
        private function clientDataHandler(e:ProgressEvent):void
        {
            var socket:Socket = e.target as Socket;
            var client:SocketClient = findClient(socket);
            var msg:SocketMessage;
            trace('data', client.uid);
            while (socket.bytesAvailable)
            {
                msg = SocketMessage.parse(socket.readObject());
                dispatchEvent(new SSSEvent(SSSEvent.CLIENT_DATA, msg));
            }
        }
        
        /**
         * 给单一客户端发送数据
         * @param client
         * @param msg
         */
        public function sendOne(client:SocketClient, msg:SocketMessage):void
        {
            var socket:Socket = client.socket;
            if (socket.connected)
            {
                socket.writeObject(msg.toObject())
                socket.flush();
            }
        }
        
        /**
         * 给全部客户端发送数据
         * @param msg
         */
        public function sendAll(msg:SocketMessage):void
        {
            trace(msg.toJson());
            for each (var c:SocketClient in clients)
            {
                sendOne(c, msg);
            }
        }
        
        /**
         * 在已连接数据中查找客户端
         * @param socket
         * @return
         */
        public function findClient(socket:Socket):SocketClient
        {
            for each (var client:SocketClient in clients)
            {
                if (client.socket == socket)
                {
                    return client;
                }
            }
            return null;
        }
        
        /**
         * 关闭服务器
         */
        public function close():void
        {
            server.close();
            clients = new Dictionary();
        }
        
        /**
         * 服务器端口
         */
        public function get port():int
        {
            return server.localPort;
        }
        
        /**
         * 服务器地址
         */
        public function get host():String
        {
            return server.localAddress;
        }
    
    }

}
