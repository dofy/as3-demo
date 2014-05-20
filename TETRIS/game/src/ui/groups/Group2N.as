package ui.groups
{
    import configs.UIConfig;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Group2N extends Group
    {
        
        public function Group2N()
        {
            super();
        }
        
        override protected function initData():void
        {
            myName = '2N';
            color = UIConfig.COLOR_2N;
            data = [[[1, 1, 1, 0], [1, 0, 1, 0], [1, 0, 1, 0], [0, 0, 0, 0]], [[1, 1, 1, 0], [0, 0, 1, 0], [1, 1, 1, 0], [0, 0, 0, 0]], [[1, 0, 1, 0], [1, 0, 1, 0], [1, 1, 1, 0], [0, 0, 0, 0]], [[1, 1, 1, 0], [1, 0, 0, 0], [1, 1, 1, 0], [0, 0, 0, 0]]];
        }
    
    }

}