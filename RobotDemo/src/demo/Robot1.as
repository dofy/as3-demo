package demo 
{
	/**
     * ...
     * @author Seven Yu
     */
    public class Robot1 extends Robot 
    {
        
        public var age:int;
        
        private var speed:int;
        
        public function Robot1(speed:int) 
        {
            this.name = 'Robot1';
            this.speed = speed;
            this.age = 10;
        }
        
        public function fly():void
        {
            trace('I belive I can fly, I am ' + age + ' years old.');
        }
        
        override public function walk():void
        {
            trace('Yes yes I can walk... and my speed is ' + speed);
        }
        
    }

}