package  
{
    import managers.MessageManager;
    import messages.Message;
    import messages.MessageType;
    import utils.Tool;
	/**
     * ...
     * @author 1209C
     */
    public class B 
    {
        
        public function B() 
        {
            MessageManager.addMessage(MessageType.NAME_CHANGED, onNameChanged);
            
            Tool.traceLine();
            trace('测试消息是否被注册');
            trace('B 是否注册了 Talk 消息:', MessageManager.hasMessage(MessageType.TALK, onNameChanged));
            Tool.traceLine();
        }
        
        private function onNameChanged(msg:Message):void 
        {
            trace('B 得到 ' + msg.data.name + ' 名字变化的通知, 名字是', msg.data.value);
        }
        
    }

}