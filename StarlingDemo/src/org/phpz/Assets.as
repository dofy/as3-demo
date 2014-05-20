package org.phpz
{
    import starling.textures.Texture;
    import starling.textures.TextureAtlas;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Assets
    {
        [Embed(source="../../../assets/ta.png")]
        private static var SImage:Class;
        
        [Embed(source="../../../assets/ta.xml",mimeType="application/octet-stream")]
        private static var SXml:Class;
        
        private static var _ta:TextureAtlas;
        
        public static function getTexture(name:String):Texture
        {
            return ta.getTexture(name);
        }
        
        public static function getTextures(name:String):Vector.<Texture>
        {
            return ta.getTextures(name);
        }
        
        private static function get ta():TextureAtlas
        {
            if (_ta == null)
            {
                _ta = new TextureAtlas(Texture.fromBitmap(new SImage), XML(new SXml));
            }
            return _ta;
        }
    
    }

}