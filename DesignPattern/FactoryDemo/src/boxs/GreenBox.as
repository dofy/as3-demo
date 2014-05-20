package boxs
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GreenBox extends BaseBox
    {
        
        public function GreenBox()
        {
            super();
        }
        
        override protected function createBox():void
        {
            graphics.beginFill(0x008000);
            graphics.drawRect(0, 0, size, size);
            graphics.endFill();
        }
    
    }

}