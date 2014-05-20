package ui
{
    import events.BallEvent;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.text.TextField;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Sprite
    {
        
        private var _id:int;
        private var _color:uint;
        private var _speed:Number;
        
        private var overLine:int;
        
        public function Ball(id:int, overLine:int)
        {
            var txt:MyText = new MyText(String(id));
            
            _id = id;
            
            this.overLine = overLine;
            
            _color = Math.round(Math.random() * 0xffffff);
            
            this.graphics.beginFill(_color);
            this.graphics.drawCircle(0, 0, 20);
            this.graphics.endFill();
            
            addChild(txt);
            txt.x = -txt.width / 2;
            txt.y = -txt.height / 2;
        }
        
        public function run():void
        {
            _speed = Math.random() * 10 + 5;
            this.addEventListener(Event.ENTER_FRAME, onFrame);
        }
        
        private function onFrame(evt:Event):void
        {
            this.x += _speed;
            
            if (this.x >= overLine)
            {
                this.removeEventListener(Event.ENTER_FRAME, onFrame);
                dispatchEvent(new BallEvent(BallEvent.COMPLETE));
            }
        }
        
        public function get id():int
        {
            return _id;
        }
        
        public function get color():uint 
        {
            return _color;
        }
        
        public function get speed():Number 
        {
            return _speed;
        }
    
    }

}