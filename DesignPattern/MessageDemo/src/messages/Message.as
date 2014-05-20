package messages
{
    
    /**
     * 消息体
     * @author 1209C
     */
    public class Message
    {
        
        private var _type:String;
        
        private var _data:*;
        
        /**
         * 构造消息
         * @param type  类型
         * @param data  携带数据
         */
        public function Message(type:String, data:*)
        {
            _type = type;
            _data = data;
        }
        
        /**
         * 消息类型
         */
        public function get type():String
        {
            return _type;
        }
        
        /**
         * 携带数据
         */
        public function get data():*
        {
            return _data;
        }
    
    }

}