package  
{
	/**
     * ...
     * @author 1209C
     */
    public class C extends Observer 
    {
        
        public function C() 
        {
            
        }
        
        override public function update():void
        {
            trace('c 得到通知');
        }
    }

}