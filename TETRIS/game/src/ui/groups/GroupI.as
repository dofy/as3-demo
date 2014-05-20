package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GroupI extends Group
    {
        
        public function GroupI()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = 'I';
            color = UIConfig.COLOR_I;
            data = [[[0, 0, 0, 0], [1, 1, 1, 1], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 1, 0, 0], [0, 1, 0, 0], [0, 1, 0, 0], [0, 1, 0, 0]]];
        }
    
    }

}