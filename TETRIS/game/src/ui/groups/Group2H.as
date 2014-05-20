package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Group2H extends Group
    {
        
        public function Group2H()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = '2H';
            color = UIConfig.COLOR_2H;
            data = [[[1, 0, 1, 0], [1, 1, 1, 0], [1, 0, 1, 0], [0, 0, 0, 0]], [[1, 1, 1, 0], [0, 1, 0, 0], [1, 1, 1, 0], [0, 0, 0, 0]]];
        }
    
    }

}