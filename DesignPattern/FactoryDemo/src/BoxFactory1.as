package
{
    import boxs.RedBox;
    import boxs.GreenBox;
    import boxs.BaseBox;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BoxFactory1
    {
        
        public static const TYPE_RED:int = 1;
        public static const TYPE_GREEN:int = 2;
        
        public function BoxFactory1()
        {
        
        }
        
        static public function getBox(type:int):BaseBox
        {
            switch (type)
            {
                case TYPE_RED: 
                    return new RedBox();
                    break;
                case TYPE_GREEN: 
                    return new GreenBox();
                    break;
                default: 
                    break;
            }
            return null;
        }
    
    }

}