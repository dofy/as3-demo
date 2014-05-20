package
{
    import flash.filesystem.File;
    import lzm.starling.gestures.DragGestures;
    import lzm.starling.STLConstant;
    import lzm.starling.STLMainClass;
    import lzm.starling.swf.Swf;
    import starling.display.Sprite;
    import starling.text.TextField;
    import starling.utils.AssetManager;
    import starling.utils.formatString;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Game extends STLMainClass
    {
        private var textfield:TextField;
        
        public function Game()
        {
            super();
            
            Swf.init(this);
            
            textfield = new TextField(200, 100, "loading....");
            textfield.x = (STLConstant.StageWidth - textfield.width) / 2;
            textfield.y = (STLConstant.StageHeight - textfield.height) / 2;
            addChild(textfield);
            
            var assets:AssetManager = new AssetManager(STLConstant.scale, STLConstant.useMipMaps);
            
            var file:File = File.applicationDirectory;
            assets.enqueue(file.resolvePath(formatString("assets/{0}x/", STLConstant.scale)));
            assets.loadQueue(function(ratio:Number):void
                {
                    textfield.text = "loading...." + int(ratio * 100) + "%";
                    if (ratio == 1)
                    {
                        textfield.removeFromParent(true);
                        
                        var swf:Swf = new Swf(assets.getByteArray("assets"), assets);
                        
                        var sprite:Sprite = swf.createSprite("spr_All");
                        addChild(sprite);
                        
                        new DragGestures(sprite);
                    }
                });
        }
    
    }

}