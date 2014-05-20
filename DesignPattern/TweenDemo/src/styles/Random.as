package styles 
{
    import flash.geom.Point;
	/**
     * ...
     * @author 1209C
     */
    public class Random implements IStyle 
    {
        
        public function Random() 
        {
            
        }
        
        public function exec(x:int, y:int):Point
        {
            return new Point(Math.random() * 800, Math.random() * 600);
        }
        
    }

}