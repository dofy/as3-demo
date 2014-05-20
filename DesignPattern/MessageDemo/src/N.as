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
    public class N 
    {
        
        public function N() 
        {
            
        }
        
        public function set myName(value:String):void
        {
            Tool.traceLine();
            trace('my name is', value);
            Tool.traceLine();
            // N 的 NAME_CHANGED 消息
            MessageManager.notify(new Message(MessageType.NAME_CHANGED, { 'name':'N', 'value':value } ));
            
            MessageManager.notify(new Message(MessageType.TALK, 'Hi, I am Class N and my name is ' + value));
        }
        
    }

}