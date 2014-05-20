package
{
    import flash.display.Sprite;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class HowManyOne extends Sprite
    {
        
        public function HowManyOne()
        {
            trace(howMany(15, 2));
        }
        
        private function howMany(num:Number, target:int):Number
        {
            for (var i:Number = 1; i < num; i *= 10)
            {
                trace('>>', i);
            }
            return 0;
        }
    }

}