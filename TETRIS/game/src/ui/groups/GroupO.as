package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GroupO extends Group
    {
        
        public function GroupO()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = 'O';
            color = UIConfig.COLOR_O;
            data = [[[0, 1, 1, 0], [0, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]]];
        }
    
    }

}