package nicegame.util
{
    import flash.utils.Dictionary;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MemCache
    {
        
        private static var pool:Dictionary = new Dictionary(true);
        
        public static function setCache(key:String, value:*):void
        {
            pool[key] = value;
        }
        
        public static function getCache(key:String):*
        {
            return pool[key] || null;
        }
        
        public static function delCache(key:String):void
        {
            delete pool[key];
        }
    
    }

}