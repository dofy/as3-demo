package
{
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import lzm.starling.STLStarup;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends STLStarup
    {
        
        public function Main():void
        {
            super();
            
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            initStarling(Game, 480, true, true);
        }
    
    }

}