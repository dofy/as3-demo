package phpz
{
    import flash.events.Event;
    import flash.filesystem.File;
    import starling.textures.Texture;
    import starling.utils.AssetManager;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Assets2
    {
        
        private static var _self:Assets2;
        
        private var _am:AssetManager;
        
        private var isLoaded:Boolean = false;
        
        private var _onComplete:Function;
        
        public function Assets2()
        {
            _am = new AssetManager();
            _am.enqueue(File.applicationDirectory.resolvePath('assets'));
        }
        
        private function onProgress(p:Number):void
        {
            if (p == 1)
            {
                isLoaded = true;
                _onComplete && _onComplete();
            }
        }
        
        public static function get instance():Assets2
        {
            if (_self == null)
            {
                _self = new Assets2();
            }
            
            return _self;
        }
        
        public function load(onComplete:Function):void
        {
            if (!isLoaded)
            {
                _onComplete = onComplete;
                _am.loadQueue(onProgress);
            }
            else
            {
                onComplete();
            }
        }
        
        public function getTexture(name:String):Texture
        {
            return _am.getTexture(name);
        }
    
    }

}