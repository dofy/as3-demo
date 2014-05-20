package styles 
{
    import flash.geom.Point;
	/**
     * ...
     * @author 1209C
     */
    public class Normal implements IStyle
    {
        
        public function Normal() 
        {
            
        }
        
        public function exec(x:int, y:int):Point
        {
            return new Point(x + 5, y + 5);
        }
        
    }

}