package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GroupS extends Group
    {
        
        public function GroupS()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = 'S';
            color = UIConfig.COLOR_S;
            data = [[[1, 0, 0, 0], [1, 1, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]], [[0, 1, 1, 0], [1, 1, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]];
        }
    
    }

}