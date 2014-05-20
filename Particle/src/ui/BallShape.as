package ui
{
    import flash.display.Shape;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BallShape extends Shape
    {
        
        public function BallShape(radius:int)
        {
            graphics.beginFill(0xffffff, 0.5);
            graphics.drawCircle(0, 0, radius);
            graphics.endFill();
        }
    
    }

}