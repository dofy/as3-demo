package core
{
    import ui.groups.*;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GroupFactory
    {
        
        private static var groupsB:Array = [GroupI, GroupO, GroupO, GroupS, GroupS, GroupZ, GroupZ, GroupT, GroupT, GroupT, GroupL, GroupL, GroupL, GroupJ, GroupJ, GroupJ];
        private static var groupsE:Array = [Group2T, Group2I, Group2N, Group2H, Group2S, Group2S, Group2Z, Group2Z, Group2L, Group2L];
        
        //private static var groups:Array = [GroupI];
        
        private static var _useExpand:Boolean = false;
        
        private static var _groups:Array;
        
        private static var _length:uint;
        
        private static var _curGroup:IGroup;
        
        private static var index:int = -1;
        
        public static function randGroup(randDir:Boolean = false):IGroup
        {
            index = Math.floor(Math.random() * groups.length);
            _curGroup = new groups[index]();
            randDir && _curGroup.randMode();
            return _curGroup;
        }
        
        public static function nextGroup(randDir:Boolean = false):IGroup
        {
            if (++index >= length)
                index = 0;
            if (_curGroup is groups[index])
                return nextGroup(randDir);
            _curGroup = new groups[index]();
            randDir && _curGroup.randMode();
            return _curGroup;
        }
        
        static public function get useExpand():Boolean
        {
            return _useExpand;
        }
        
        static public function set useExpand(value:Boolean):void
        {
            if (_useExpand != value)
            {
                _useExpand = value;
                _groups = _useExpand ? groupsB.concat(groupsE) : groupsB;
                _length = groups.length;
            }
        }
        
        static public function get groups():Array
        {
            return _groups || groupsB;
        }
        
        static public function get curGroup():IGroup
        {
            return _curGroup;
        }
        
        static public function get length():uint
        {
            return _length;
        }
    
    }

}