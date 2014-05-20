package  
{
	/**
     * ...
     * @author Seven Yu
     */
    public class Color 
    {
        
        public static function get randColor():uint
        {
            return Math.round(Math.random() * 0xffffff);
        }
        
    }

}