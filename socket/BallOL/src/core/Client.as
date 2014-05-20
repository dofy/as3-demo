package core
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.Socket;
    import org.phpz.net.SocketMessage;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Client extends EventDispatcher
    {
        
        private var s:Socket;
        
        private static var _self:Client;
        
        public var msgHandler:Function;
        
        public function Client()
        {
        }
        
        public function connect(host:String, port:int):void
        {
            if (s == null)
            {
                s = new Socket(host, port);
                s.addEventListener(Event.CONNECT, onConnect);
                s.addEventListener(Event.CLOSE, onClose);
                s.addEventListener(IOErrorEvent.IO_ERROR, onError);
                s.addEventListener(ProgressEvent.SOCKET_DATA, onData);
            }
        }
        
        public static function get x():Client
        {
            if (_self == null)
            {
                _self = new Client();
            }
            
            return _self;
        }
        
        private function onConnect(e:Event):void
        {
            trace('connected...');
        }
        
        private function onClose(e:Event):void
        {
            trace('closed...');
        }
        
        private function onError(e:IOErrorEvent):void
        {
            trace('error...');
        }
        
        private function onData(e:ProgressEvent):void
        {
            var msg:SocketMessage;
            while (s.bytesAvailable)
            {
                msg = SocketMessage.parse(s.readObject());
                msgHandler && msgHandler(msg);
            }
        }
        
        public function send(type:String, from:String, body:Object):void
        {
            s.writeObject(new SocketMessage(type, from, body).toObject());
            s.flush();
        }
    
    }

}