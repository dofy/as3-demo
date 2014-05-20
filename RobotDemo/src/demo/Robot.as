package demo 
{
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Robot 
    {
        
        public var name:String;
        
        public function Robot() 
        {
            this.name = 'robot';
        }
        
        public function talk():void
        {
            trace('Hello, my name is ' + this.name);
        }
        
        public function walk():void
        {
            trace('Hey, I can walk...');
        }
        
    }

}