package bwie.game
{
    import morn.core.components.Image;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class ToolImage extends Image
    {
        
        private const path:String = 'assets/images/';
        
        public function ToolImage(url:String)
        {
            if (App.asset.hasClass(url))
            {
                this.url = url;
            }
            else
            {
                this.url = path + url;
            }
        }
    
    }

}