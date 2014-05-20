package  
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
	import flash.display.Sprite;
    import flash.display.StageDisplayState;
    import flash.utils.ByteArray;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class SocketData extends Sprite 
    {
        [Embed(source = "hand.jpg")]
        private var JPG:Class;
        
        public function SocketData() 
        {
            super();
            
            var bitmap:Bitmap = new JPG() as Bitmap;
            
            var bd:BitmapData = new BitmapData(bitmap.width, bitmap.height);
            
            stage.displayState = StageDisplayState.FULL_SCREEN;
            
        }
        
    }

}