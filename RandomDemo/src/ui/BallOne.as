package ui
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BallOne extends Ball
    {
        
        private var s:Number;
        
        public function BallOne()
        {
            super();
            s = Math.random() * 0.1 + 0.89;
        }
        
        override public function get xSpeed():Number
        {
            if (_xSpeed < 0.1 && _xSpeed > -0.1)
            {
                initXSpeed();
            }
            else
            {
                _xSpeed *= s;
            }
            return _xSpeed;
        }
        
        override public function get ySpeed():Number
        {
            if (_ySpeed < 0.1 && _ySpeed > -0.1)
            {
                initYSpeed();
            }
            else
            {
                _ySpeed *= s;
            }
            return _ySpeed;
        }
    
    }

}