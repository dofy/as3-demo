package ui
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BallTwo extends Ball
    {
        
        public function BallTwo()
        {
            super();
        }
        
        override public function negateXSpeed():void
        {
            super.initXSpeed();
        }
        
        override public function negateYSpeed():void
        {
            super.initYSpeed();
        }
    
    }

}