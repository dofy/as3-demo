package managers
{
    import flash.utils.Dictionary;
    import messages.Message;
    
    /**
     * 消息管理器 (基于观察者模式)
     * @author 1209C
     */
    public class MessageManager
    {
        /*
         * 保存所有消息订阅信息
         *
         * 格式:
         * 字典[消息类型] = [消息处理函数, ...] Array
         *
         * */
        static private var _messages:Dictionary = new Dictionary();
        
        public function MessageManager()
        {
        
        }
        
        /**
         * 添加订阅
         * @param type  消息类型
         * @param func  处理函数
         */
        static public function addMessage(type:String, func:Function):void
        {
            // 判断该类型的处理函数列表是否存在
            if (!_messages[type])
            {
                _messages[type] = [];
            }
            // push 函数到列表中
            _messages[type].push(func);
        }
        
        /**
         * 取消消息订阅
         * @param type  消息类型
         * @param func  处理函数
         */
        static public function removeMessage(type:String, func:Function):void
        {
            var msgList:Array = _messages[type];
            if (msgList)
            {
                var index:int = msgList.indexOf(func);
                if (index > -1)
                {
                    msgList.splice(index, 1);
                }
            }
        }
        
        /**
         * 判断消息是否注册过
         * @param type  消息类型
         * @param func  处理函数
         * @return  消息是否已被注册
         */
        static public function hasMessage(type:String, func:Function):Boolean
        {
            var msgList:Array = _messages[type];
            return msgList && msgList.indexOf(func) > -1;
        }
        
        /**
         * 广播消息
         * @param msg   消息体
         */
        static public function notify(msg:Message):void
        {
            // 得到对应类型的消息处理函数列表
            var msgList:Array = _messages[msg.type];
            if (msgList)
            {
                // 遍历调用
                for each (var func:Function in msgList)
                {
                    func(msg);
                }
            }
        }
    
    }

}