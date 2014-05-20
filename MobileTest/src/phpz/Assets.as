package phpz
{
    import flash.events.Event;
    import flash.events.EventDispatcher;
    import flash.filesystem.File;
    import starling.textures.Texture;
    import starling.utils.AssetManager;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Assets extends EventDispatcher
    {
        
        private static var _self:Assets;
        
        private var _am:AssetManager;
        
        private var isLoaded:Boolean = false;
        
        public function Assets()
        {
            _am = new AssetManager();
            _am.enqueue(File.applicationDirectory.resolvePath('assets'));
        }
        
        private function onProgress(p:Number):void
        {
            if (p == 1)
            {
                isLoaded = true;
                dispatchEvent(new Event(Event.COMPLETE));
            }
        }
        
        public static function getInstance():Assets
        {
            if (_self == null)
            {
                _self = new Assets();
            }
            
            return _self;
        }
        
        public function load():void
        {
            if (!isLoaded)
                _am.loadQueue(onProgress);
        }
        
        public function getTexture(name:String):Texture
        {
            return _am.getTexture(name);
        }
    
    }

}