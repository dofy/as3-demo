package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Group2I extends Group
    {
        
        public function Group2I()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = '2I';
            color = UIConfig.COLOR_2I;
            data = [[[1, 0, 0, 0], [1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]];
        }
    
    }

}