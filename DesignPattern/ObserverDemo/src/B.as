package  
{
	/**
     * ...
     * @author 1209C
     */
    public class B extends Observer 
    {
        
        public function B() 
        {
        }
        
        override public function update():void
        {
            trace('b 得到通知');
        }
        
    }

}