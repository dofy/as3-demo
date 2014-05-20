package ui.groups
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public interface IGroup
    {
        function prevMode():void;
        function nextMode():void;
        function randMode():void;
        function get modeLength():int;
        function get currentMode():int;
        function get currentData():Array;
        function get groupColor():uint;
        function get minCol():int;
        function get maxCol():int;
        function get minRow():int;
        function get maxRow():int;
        function get groupName():String;
    }

}