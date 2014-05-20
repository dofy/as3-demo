package boxs  
{
	import flash.display.Shape;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class BaseBox extends Shape 
    {
        
        protected var size:int = 30;
        
        public function BaseBox() 
        {
            super();
			createBox();
        }
        
        protected function createBox():void
        {
            
        }
        
    }

}