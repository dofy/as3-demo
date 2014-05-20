package fla.assets
{
    
    import flash.display.MovieClip;
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Selector extends MovieClip
    {
        
        private var _selected:Boolean = false;
        
        public function Selector()
        {
            init();
        }
        
        private function init():void
        {
            selected = false;
            
			//this.mouseEnabled=false;
            mouseChildren = false;
            buttonMode = true;
        }
        
        public function set num(value:int):void
        {
            txtNum.text = value.toString();
        }
        
        public function get num():int
        {
            return parseInt(txtNum.text);
        }
        
        public function get selected():Boolean
        {
            return _selected;
        }
        
        public function set selected(value:Boolean):void
        {
            _selected = value;
            gotoAndStop(value ? 2 : 1);
        }
    
    }

}