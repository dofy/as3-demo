package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Group2S extends Group
    {
        
        public function Group2S()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = '2S';
            color = UIConfig.COLOR_2S;
            data = [[[0, 1, 1, 0], [0, 1, 0, 0], [1, 1, 0, 0], [0, 0, 0, 0]], [[1, 0, 0, 0], [1, 1, 1, 0], [0, 0, 1, 0], [0, 0, 0, 0]]];
        }
    
    }

}