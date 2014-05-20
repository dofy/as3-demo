package nicegame.media
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MyFile
    {
        
        public var url:String;
        public var name:String;
        
        public function MyFile(url:String, name:String)
        {
            this.url = url;
            this.name = name;
        }
        
        public static function parse(obj:Object):MyFile
        {
            return new MyFile(obj['url'] || '', obj['name'] || '');
        }
    
    }

}