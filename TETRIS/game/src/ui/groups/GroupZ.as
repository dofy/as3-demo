package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GroupZ extends Group
    {
        
        public function GroupZ()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = 'Z';
            color = UIConfig.COLOR_Z;
            data = [[[1, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 0, 1, 0], [0, 1, 1, 0], [0, 1, 0, 0], [0, 0, 0, 0]]];
        }
    
    }

}