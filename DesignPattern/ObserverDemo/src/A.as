package  
{
	/**
     * ...
     * @author 1209C
     */
    public class A extends Subject 
    {
        
        public function A() 
        {
        }
        
        public function set myName(value:String):void
        {
            trace('我的名字是', value);
            notify();
        }
        
    }

}