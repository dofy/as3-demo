package org.phpz.net
{
    
    /**
     * 消息体定义
     * @author Seven Yu
     */
    public class SocketMessage extends Object
    {
        // 无状态消息
        public static const NONE:String = 'none';
        
        // 连接成功消息
        public static const CONNECTED:String = 'connected';
        // 断开连接消息
        public static const CLOSED:String = 'closed';
        
        // 返回自己的 uid 消息
        public static const ME:String = 'me';
        
        // 进入
        public static const JOIN:String = 'join';
        // 退出
        public static const QUIT:String = 'quit';
        
        // ---=== 三种广播数据消息 ===---
        // 普通文本类
        public static const TEXT:String = 'text';
        // 用户列表类
        public static const LIST:String = 'list';
        // 登陆
        public static const LOGIN:String = 'login';
        
        // 消息体结构
        private var _type:String;  // 消息类型
        private var _from:String;  // 发送者 UID
        private var _to:String;    // 接收者 UID
        private var _time:Number;  // 发送时间
        private var _body:Object;  // 发送内容
        
        /**
         * 构建消息
         * @param type  类型
         * @param from  发送者
         * @param body  消息体
         * @param to    接收者
         */
        public function SocketMessage(type:String = 'none', from:String = null, body:Object = null, to:String = null)
        {
            _type = type;
            _from = from;
            _to = to;
            _body = body;
            
            _time = new Date().getTime();
        }
        
        /**
         * 解析消息
         * @param obj
         * @return
         */
        public static function parse(obj:Object):SocketMessage
        {
            return new SocketMessage(obj['type'] || NONE, obj['from'], obj['body'], obj['to']);
        }
        
        public function get type():String
        {
            return _type;
        }
        
        public function get from():String
        {
            return _from;
        }
        
        public function get to():String
        {
            return _to;
        }
        
        public function get time():Number
        {
            return _time;
        }
        
        public function get body():Object
        {
            return _body;
        }
        
        /**
         * 转换 json 格式
         * @return
         */
        public function toJson():String
        {
            return JSON.stringify(this);
        }
        
        /**
         * 转换 object 
         * @return
         */
        public function toObject():Object
        {
            return JSON.parse(toJson());
        }
    
    }

}