package utils
{
    import flash.utils.Dictionary;
    
    /**
     * 键盘管理器
     * @author Seven Yu
     */
    public class KeyManager
    {
        private var keyCount:int;
        
        private var keys:Dictionary;
        
        private static var _self:KeyManager;
        
        public function KeyManager()
        {
            keyCount = 0;
            keys = new Dictionary();
        }
        
        public static function get master():KeyManager
        {
            if (_self == null)
            {
                _self = new KeyManager();
            }
            
            return _self;
        }
        
        /**
         * 已按下的键
         * @param code
         */
        public function addKey(code:int):void
        {
            if (!hasKey(code))
            {
                keyCount++;
                keys[code] = true;
            }
        }
        
        /**
         * 弹起的按键
         * @param code
         */
        public function delKey(code:int):void
        {
            if (hasKey(code))
            {
                keyCount--;
                delete keys[code];
            }
        }
        
        /**
         * 判断是否按下了此键
         * @param code
         * @return
         */
        public function hasKey(code:int):Boolean
        {
            return !!keys[code];
        }
        
        /**
         * 已按下的键中是否有数组之一
         * @param codes
         * @return
         */
        public function hasOne(codes:Array):Boolean
        {
            var i:int = 0, l:int = codes.length;
            if (l <= 0)
            {
                return false;
            }
            for (; i < l; i++)
            {
                if (hasKey(codes[i]))
                {
                    return true;
                }
            }
            return false;
        }
        
        /**
         * 是否包含全部数组中的按键
         * @param codes
         * @return
         */
        public function hasAll(codes:Array):Boolean
        {
            var i:int = 0, l:int = codes.length;
            if (l <= 0)
            {
                return false;
            }
            for (; i < l; i++)
            {
                if (!hasKey(codes[i]))
                {
                    return false;
                }
            }
            return true;
        }
        
        /**
         * 没有任何按键按下
         */
        public function get isEmpty():Boolean
        {
            return keyCount <= 0;
        }
    
    }

}