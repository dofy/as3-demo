package view
{
    import data.Global;
    import flash.events.AsyncErrorEvent;
    import flash.events.NetStatusEvent;
    import flash.net.SharedObject;
    import flash.utils.setTimeout;
    import game.ui.LoginUI;
    import morn.core.handlers.Handler;
    import org.phpz.net.SocketMessage;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Login extends LoginUI
    {
        
        private var so:SharedObject;
        
        public function Login()
        {
            super();
            
            btnLogin.clickHandler = new Handler(doLogin);
            
            so = SharedObject.getLocal('user_info', '/');
            
            so.addEventListener(AsyncErrorEvent.ASYNC_ERROR, errorHandler);
            so.addEventListener(NetStatusEvent.NET_STATUS, netStatusHandler);
            
            nickName.text = so.data['nickName'] || 'NoName';
        }
        
        private function errorHandler(e:AsyncErrorEvent):void 
        {
            trace(e);
        }
        
        private function netStatusHandler(e:NetStatusEvent):void 
        {
            trace(e);
            trace(JSON.stringify(e.info));
        }
        
        /**
         * 登录操作
         */
        private function doLogin():void
        {
            if (nickName.text == '')
            {
                nickName.showBorder();
                setTimeout(function():void
                    {
                        nickName.removeChildByName('border')
                    }, 1000);
                return;
            }
            
            so.data['nickName'] = nickName.text;
            so.flush();
            
            Global.client.writeObject(new SocketMessage(SocketMessage.LOGIN, Global.uid, {name: nickName.text}).toObject());
            Global.client.flush();
            this.close();
        }
    
    }

}