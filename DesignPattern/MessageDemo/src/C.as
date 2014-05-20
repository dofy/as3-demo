package
{
    import managers.MessageManager;
    import messages.Message;
    import messages.MessageType;
    
    /**
     * ...
     * @author 1209C
     */
    public class C
    {
        
        public function C()
        {
            MessageManager.addMessage(MessageType.NAME_CHANGED, changeHandler);
            MessageManager.addMessage(MessageType.A_AGE, changeHandler);
            MessageManager.addMessage(MessageType.TALK, changeHandler);
        
            // 旧测试代码
            //MessageManager.addMessage(MessageType.NAME_CHANGED, onNameChanged);
            //MessageManager.addMessage(MessageType.A_AGE, onAAgeChanged);
        }
        
        /**
         * 统一处理消息
         * @param msg   消息体
         */
        private function changeHandler(msg:Message):void
        {
            trace('--- C 得到消息, 类型为', msg.type, '---');
            switch (msg.type)
            {
                case MessageType.NAME_CHANGED: 
                    trace(msg.data.name, '\'s name has be changed to', msg.data.value);
                    break;
                case MessageType.A_AGE: 
                    trace('A\'s age is', msg.data);
                    break;
                default: 
                    trace('收到了除 Name Age 以外的消息');
                    trace('类型是', msg.type, ', 内容是', msg.data);
                    break;
            }
            
            // 测试取消订阅
            if (MessageManager.hasMessage(MessageType.NAME_CHANGED, changeHandler))
            {
                MessageManager.removeMessage(MessageType.NAME_CHANGED, changeHandler);
                trace('C 取消了对 NAME_CHANGED 消息的订阅');
            }
        }
        
        // 旧测试代码
        private function onNameChanged(msg:Message):void
        {
            trace('C 得到 ' + msg.data.name + ' 名字变化的通知, 名字是', msg.data.value);
        }
        
        private function onAAgeChanged(msg:Message):void
        {
            trace('C 得到 A 年龄变化的通知,年龄是', msg.data);
        }
    
    }

}