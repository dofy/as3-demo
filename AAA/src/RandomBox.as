package
{
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import ui.Box;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class RandomBox extends Sprite
    {
        
        public function RandomBox()
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            
            var sizeX:int = 26;
            var sizeY:int = 14;
            for (var i:int = 0; i < sizeX; i++)
            {
                for (var j:int = 0; j < sizeY; j++)
                {
                    var alpha:Number = 1 - (i + j) / (sizeX + sizeY);
                    var b:Box = new Box(alpha);
                    b.x = i * 50;
                    b.y = j * 50;
                    addChild(b);
                }
            }
        }
    
    }

}