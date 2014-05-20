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
    public class A 
    {
        
        public function A() 
        {
            
        }
        
        public function set myName(value:String):void
        {
            Tool.traceLine();
            trace('my name is', value);
            Tool.traceLine();
            // 发送 NAME_CHANGED 消息, 消息内容包括 name 和 value
            MessageManager.notify(new Message(MessageType.NAME_CHANGED, {'name':'A', 'value':value}));
        }
        
        public function set age(value:int):void
        {
            Tool.traceLine();
            trace('my age is', value);
            Tool.traceLine();
            // 发送 A_AGE 消息
            MessageManager.notify(new Message(MessageType.A_AGE, value));
        }
        
    }

}