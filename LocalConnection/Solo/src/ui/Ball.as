package ui
{
    import flash.display.Shape;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Shape
    {
        
        public function Ball()
        {
        }
        
        public function red():void
        {
            draw(0xff3300);
        }
        
        public function green():void
        {
            draw(0x008000);
        }
        
        private function draw(color:uint):void
        {
            graphics.clear();
            graphics.beginFill(color);
            graphics.drawCircle(0, 0, 100);
            graphics.endFill();
        }
    
    }

}