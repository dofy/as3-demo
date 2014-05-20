package
{
    import boxs.YellowBox;
    import boxs.IBox;
    import boxs.BlueBox;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BoxFactory2
    {
        
        public static const TYPE_BLUE:int = 1;
        public static const TYPE_YELLOW:int = 2;
        
        public function BoxFactory2()
        {
        
        }
        
        static public function getBox(type:int):IBox
        {
            switch (type)
            {
                case TYPE_BLUE: 
                    return new BlueBox();
                    break;
                case TYPE_YELLOW: 
                    return new YellowBox();
                    break;
                default: 
                    break;
            }
            return null;
        }
    
    }

}