package view
{
    import data.Global;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.events.ProgressEvent;
    import flash.globalization.StringTools;
    import flash.utils.Dictionary;
    import game.ui.MainPageUI;
    import morn.core.handlers.Handler;
    import morn.core.utils.StringUtils;
    import mx.utils.StringUtil;
    import org.phpz.net.SocketMessage;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MainPage extends MainPageUI
    {
        
        private var selIndex:int = 0;
        private var userArr:Array;
        private var userMap:Dictionary;
        
        public function MainPage()
        {
            super();
            
            bindEvents();
            initSocket();
        }
        
        private function bindEvents():void
        {
            send.addEventListener(MouseEvent.CLICK, sendHandler);
            input.addEventListener(KeyboardEvent.KEY_UP, sendHandler);
            users.selectHandler = new Handler(onSelected);
        }
        
        private function onSelected(index:int):void
        {
            selIndex = index >= 0 ? index : selIndex;
        }
        
        /**
         * 发送数据
         * @param e 
         */
        private function sendHandler(e:Event):void
        {
            if (e.type == KeyboardEvent.KEY_UP && (e as KeyboardEvent).keyCode == 13 || e.type == MouseEvent.CLICK)
            {
                // 说话
                var to:String = null;
                // 0 索引为全部用户
                if (selIndex > 0)
                {
                    to = userArr[selIndex - 1].uid;
                }
                Global.client.writeObject(new SocketMessage(SocketMessage.TEXT, Global.uid, {name: nickName.text, content: input.text}, to).toObject());
                Global.client.flush();
                
                input.text = '';
            }
        }
        
        /**
         * 初始化 Socket 对象
         */
        private function initSocket():void
        {
            Global.client.addEventListener(Event.CLOSE, closeHandler);
            Global.client.addEventListener(ProgressEvent.SOCKET_DATA, dataHandler);
        }
        
        /**
         * 断开连接
         */
        private function closeHandler(e:Event):void
        {
            trace('closed...');
        }
        
        /**
         * 数据处理句柄
         * @param e     数据 Event 对象
         */
        private function dataHandler(e:ProgressEvent):void
        {
            while (Global.client.bytesAvailable)
            {
                // 解析数据包对象
                var msg:SocketMessage = SocketMessage.parse(Global.client.readObject());
                
                // 获取当前时间
                var d:Date = new Date();
                var dStr:String = [fixZero(d.getHours()), fixZero(d.getMinutes()), fixZero(d.getSeconds())].join(':');
                
                var str:String;
                
                switch (msg.type)
                {
                    // 用户列表
                    case SocketMessage.LIST: 
                        userArr = msg.body as Array;
                        userMap = new Dictionary();
                        
                        var labs:Array = ['全部'];
                        
                        for (var i:int = 0, l:int = userArr.length; i < l; i++)
                        {
                            labs.push('(' + userArr[i].uid + ') ' + userArr[i].body.name);
                            userMap[userArr[i].uid] = userArr[i].body.name;
                        }
                        users.dataSource = labs;
                        users.selectedIndex = selIndex;
                        trace(JSON.stringify(userArr));
                        break;
                    
                    // 用户登录
                    case SocketMessage.LOGIN: 
                        // 自己登录
                        if (msg.from == Global.uid)
                        {
                            txtUid.appendText(msg.from);
                            nickName.text = msg.body.name;
                        }
                        // 其他人登录
                        else
                        {
                            str = msg.body.name + ' 登录了';
                            echo(dStr, str);
                        }
                        break;
                    
                    // 退出
                    case SocketMessage.QUIT: 
                        str = getName(msg.from, true) + ' 退出了';
                        echo(dStr, str);
                        break;
                    
                    // 文本消息
                    case SocketMessage.TEXT: 
                        str = msg.from == Global.uid ? '<b>' + msg.body['name'] + '</b>' : msg.body['name'];
                        if (msg.to != null)
                        {
                            str += ' 对 ' + (msg.to == Global.uid ? '<b>' + getName(msg.to) + '</b>' : getName(msg.to));
                        }
                        str += ' 说:' + msg.body['content'];
                        echo(dStr, str);
                        break;
                    case SocketMessage.JOIN: 
                    default: 
                        break;
                }
                
            }
        }
        
        /**
         * 获取用户昵称
         * @param uid       用户ID
         * @param withId    返回信息是否包含用户 ID
         * @return          用户昵称
         */
        private function getName(uid:String, withId:Boolean = false):String
        {
            return (userMap[uid] || 'NoName') + (withId && "(ID:" + uid + ")");
        }
        
        /**
         * 输出
         * @param dStr  时间字符串
         * @param str   内容
         */
        private function echo(dStr:String, str:String):void
        {
            output.appendText('<font color="#cccccc"><i>[' + dStr + ']</i></font> ' + str + '\n');
            output.scrollTo(output.maxScrollV);
        }
        
        /**
         * 格式化数字
         * @param num   数字
         * @return      补零后的结果
         */
        private function fixZero(num:int):String
        {
            return num > 9 ? num.toString() : '0' + num;
        }
    
    }

}