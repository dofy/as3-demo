package comps
{
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class PageBtn extends TextField
    {
        
        private var _selected:Boolean;
        
        public function PageBtn(n:int)
        {
            super();
            
            init();
            
            this.text = n.toString();
        }
        
        private function init():void
        {
            var tf:TextFormat = new TextFormat('consolas', 14);
            tf.align = TextFormatAlign.CENTER;
            
            this.width = 30;
            this.height = 20;
            this.selectable = false;
            this.defaultTextFormat = tf;
            this.border = true;
            
            selected = false;
        }
        
        public function get selected():Boolean
        {
            return _selected;
        }
        
        public function set selected(value:Boolean):void
        {
            _selected = value;
            
            this.borderColor = value ? 0xff0000 : 0x008000;
        }
    
    }

}