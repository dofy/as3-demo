package utils
{
    import flash.net.SharedObject;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class SOTool
    {
        
        private static var _self:SOTool;
        
        private var so:SharedObject;
        
        public function SOTool()
        {
            so = SharedObject.getLocal('file_demo');
        }
        
        public static function get instance():SOTool
        {
            if (!_self)
            {
                _self = new SOTool();
            }
            
            return _self;
        }
        
        /**
         * 写数据
         * @param key       键名
         * @param value     值
         */
        public function write(key:String, value:*):void
        {
            so.data[key] = value;
            so.flush();
        }
        
        /**
         * 读数据
         * @param key           键名
         * @param defaultValue  默认值
         * @return              值
         */
        public function read(key:String, defaultValue:* = null):*
        {
            return so.data[key] || defaultValue;
        }
    
    }

}