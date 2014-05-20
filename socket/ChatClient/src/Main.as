package
{
    import data.Global;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.ProgressEvent;
    import flash.net.Socket;
    import morn.core.handlers.Handler;
    import org.phpz.net.SocketMessage;
    import view.Login;
    import view.MainPage;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        // 服务器 IP
        private const HOST:String = '192.168.1.77';
        // 端口
        private const PORT:uint = 7777;
        
        public function Main():void
        {
            App.init(this);
            App.loader.loadAssets(['assets/comp.swf'], new Handler(compHandler));
        }
        
        /**
         * 初始化
         */
        private function compHandler():void
        {
            Global.client = new Socket(HOST, PORT);
            
            Global.client.addEventListener(Event.CONNECT, connectHandler);
            Global.client.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            Global.client.addEventListener(ProgressEvent.SOCKET_DATA, dataHandler);
        }
        
        private function errorHandler(e:IOErrorEvent):void
        {
            trace('服务器连接失败', e);
        }
        
        private function connectHandler(e:Event):void
        {
            trace('connected...');
            
            addChild(new MainPage);
            App.dialog.popup(new Login);
        }
        
        /**
         * 数据处理句柄
         * @param e
         */
        private function dataHandler(e:ProgressEvent):void
        {
            while (Global.client.bytesAvailable)
            {
                var msg:SocketMessage = SocketMessage.parse(Global.client.readObject());
                
                switch (msg.type)
                {
                    // ME 消息类型用于获取自己的 ID
                    case SocketMessage.ME: 
                        Global.uid = msg.from;
                        Global.client.removeEventListener(ProgressEvent.SOCKET_DATA, dataHandler);
                        
                        break;
                    default: 
                        break;
                }
            }
        }
    
    }

}