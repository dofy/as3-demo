package org.phpz.pages
{
    import flash.events.MouseEvent;
    import game.ui.MainPageUI;
    import org.phpz.events.SSSEvent;
    import org.phpz.net.SocketClient;
    import org.phpz.net.SocketMessage;
    import org.phpz.net.SSS;
    import org.phpz.utils.Tools;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MainPage extends MainPageUI
    {
        
        // 用户数据
        private var userMap:Array;
        
        public function MainPage()
        {
            super();
            
            // 打开监听按钮
            btnListen.addEventListener(MouseEvent.CLICK, runHandler);
            
            // 服务器绑定事件
            SSS.server.addEventListener(SSSEvent.LISTEN, sssHandler);
            SSS.server.addEventListener(SSSEvent.CLOSE, sssHandler);
            SSS.server.addEventListener(SSSEvent.CLIENT_JOIN, sssHandler);
            SSS.server.addEventListener(SSSEvent.CLIENT_QUIT, sssHandler);
            SSS.server.addEventListener(SSSEvent.CLIENT_DATA, sssHandler);
            
            // 用户列表
            userList.array = [];
            userMap = [];
        }
        
        private function sssHandler(e:SSSEvent):void
        {
            if (txtLog.maxScrollV > 300)
            {
                txtLog.text = '';
            }
            txtLog.appendText([Tools.formatDate(new Date()), e.type, e.data, '\n'].join());
            txtLog.scrollTo(txtLog.maxScrollV);
            
            switch (e.type)
            {
                case SSSEvent.CLIENT_JOIN: 
                    // 给对应客户端发送 ME 类型消息, 返回 uid
                    SSS.server.sendOne(e.data as SocketClient, new SocketMessage(SocketMessage.ME, (e.data as SocketClient).uid));
                    // 给全部客户端发送 JOIN 类型消息
                    SSS.server.sendAll(new SocketMessage(SocketMessage.JOIN, e.data));
                    break;
                case SSSEvent.CLIENT_QUIT: 
                    for (var i:int = 0, l:int = userMap.length; i < l; i++)
                    {
                        if (userMap[i].uid == e.data)
                        {
                            userList.deleteItem(i);
                            userMap.splice(i, 1);
                            break;
                        }
                    }
                    
                    SSS.server.sendAll(new SocketMessage(SocketMessage.QUIT, e.data));
                    SSS.server.sendAll(new SocketMessage(SocketMessage.LIST, e.data, userMap));
                    break;
                case SSSEvent.CLIENT_DATA: 
                    var msg:SocketMessage = e.data as SocketMessage;
                    SSS.server.sendAll(msg);
                    if (msg.type == SocketMessage.LOGIN)
                    {
                        userList.addItem({uid: msg.from, name: msg.body.name});
                        userMap.push({uid: msg.from, body: msg.body});
                        SSS.server.sendAll(new SocketMessage(SocketMessage.LIST, msg.from, userMap));
                    }
                    break;
                default: 
                    // nothing...
                    break;
            }
        }
        
        /**
         * 开始监听
         * @param e
         */
        private function runHandler(e:MouseEvent):void
        {
            var port:int = parseInt(txtPort.text);
            SSS.server.bind(port);
        }
    
    }

}