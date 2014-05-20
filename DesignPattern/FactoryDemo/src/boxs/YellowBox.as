package boxs  
{
    import boxs.IBox;
	import flash.display.Shape;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class YellowBox extends Shape implements IBox 
    {
        
        private var _color:uint = 0xffff00;
        
        private var size:int = 50;
        
        public function YellowBox() 
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