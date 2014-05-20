package nicegame.demo.utils 
{
	/**
     * ...
     * @author Seven Yu
     */
    public class ColorTool 
    {
        
        public static function get random():uint
        {
            return Math.round(Math.random() * 0xffffff);
        }
        
    }

}