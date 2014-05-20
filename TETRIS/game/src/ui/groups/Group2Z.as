package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Group2Z extends Group
    {
        
        public function Group2Z()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = '2Z';
            color = UIConfig.COLOR_2Z;
            data = [[[1, 1, 0, 0], [0, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 0]], [[0, 0, 1, 0], [1, 1, 1, 0], [1, 0, 0, 0], [0, 0, 0, 0]]];
        }
    
    }

}