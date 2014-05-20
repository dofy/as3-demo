package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GroupT extends Group
    {
        
        public function GroupT()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = 'T';
            color = UIConfig.COLOR_T;
            data = [[[0, 1, 0, 0], [1, 1, 1, 0], [0, 0, 0, 0], [0, 0, 0, 0]], [[0, 1, 0, 0], [0, 1, 1, 0], [0, 1, 0, 0], [0, 0, 0, 0]], [[0, 0, 0, 0], [1, 1, 1, 0], [0, 1, 0, 0], [0, 0, 0, 0]], [[0, 1, 0, 0], [1, 1, 0, 0], [0, 1, 0, 0], [0, 0, 0, 0]]];
        }
    
    }

}