package boxs  
{
    import boxs.BaseBox;
	/**
     * ...
     * @author Seven Yu
     */
    public class RedBox extends BaseBox 
    {
        
        public function RedBox() 
        {
            super();
        }
        
        override protected function createBox():void
        {
            graphics.beginFill(0xff0000);
            graphics.drawRect(0, 0, size, size);
            graphics.endFill();
        }
    }

}