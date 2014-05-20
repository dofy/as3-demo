package boxs  
{
	import flash.display.Shape;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class BlueBox extends Shape implements IBox 
    {
        
        private var _color:uint = 0x0000ff;
        
        private var size:int = 50;
        
        public function BlueBox() 
        {
            super();
			
            graphics.beginFill(_color);
            graphics.drawRect(0, 0, size, size);
            graphics.endFill();
        }
        
        /* INTERFACE IBox */
        
        public function get color():uint 
        {
            return _color;
        }
        
    }

}