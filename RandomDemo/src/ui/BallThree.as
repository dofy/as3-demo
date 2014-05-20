package ui
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BallThree extends Ball
    {
        
        public function BallThree()
        {
            super();
        }
        
        override public function negateXSpeed():void
        {
            super.reset();
        }
        
        override public function negateYSpeed():void
        {
            super.reset();
        }
    
    }

}