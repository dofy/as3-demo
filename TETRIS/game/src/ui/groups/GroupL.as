package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GroupL extends Group
    {
        
        public function GroupL()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = 'L';
            color = UIConfig.COLOR_L;
            data = [[[0, 1, 0, 0], [0, 1, 0, 0], [0, 1, 1, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 1, 1, 0], [1, 0, 0, 0], [0, 0, 0, 0]], [[1, 1, 0, 0], [0, 1, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]], [[0, 0, 1, 0], [1, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]]];
        }
    
    }

}