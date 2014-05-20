package comps
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Pager extends Sprite
    {
        
        private var _currentPage:int;
        private var _pageCount:int;
        
        private var btns:Vector.<PageBtn>;
        
        public function Pager()
        {
            super();
            
            btns = new Vector.<PageBtn>;
            
            this.buttonMode = true;
            this.useHandCursor = true;
            
            this.addEventListener(MouseEvent.CLICK, onClick, true);
        }
        
        private function onClick(e:MouseEvent):void
        {
            var btn:PageBtn = e.target as PageBtn;
            currentPage = parseInt(btn.text);
            dispatchEvent(new Event(Event.SELECT));
        }
        
        public function get pageCount():int
        {
            return _pageCount;
        }
        
        public function set pageCount(value:int):void
        {
            _pageCount = value;
            
            btns.length = 0;
            removeChildren();
            
            for (var i:int = 0; i < value; i++)
            {
                var pb:PageBtn = new PageBtn(i + 1);
                addChild(pb);
                pb.x = i * 40;
                btns.push(pb);
            }
            
            currentPage = 1;
        }
        
        public function get currentPage():int
        {
            return _currentPage;
        }
        
        public function set currentPage(value:int):void
        {
            if (_currentPage == value || value < 1 || value > btns.length)
            {
                return;
            }
            
            _currentPage > 0 && btns[_currentPage - 1] && (btns[_currentPage - 1].selected = false);
            
            _currentPage = value;
            btns[value - 1].selected = true;
        }
    
    }

}