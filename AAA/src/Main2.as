package
{
    import com.greensock.TweenLite;
    import flash.display.Sprite;
    import ui.Box;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main2 extends Sprite
    {
        
        public function Main2()
        {
            super();
            
            graphics.beginFill(0);
            graphics.drawCircle(100, 100, 100);
            graphics.endFill();
            graphics.beginFill(0);
            graphics.drawCircle(30, 100, 100);
            graphics.endFill();
            
            tabChildren = false;
        }
    
    }

}