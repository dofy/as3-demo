package nicegame.demo 
{
    import flash.display.Sprite;
    import flash.events.IEventDispatcher;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import nicegame.events.MyEvent;
    import nicegame.vo.InfoVO;
	
	/**
     * ...
     * @author Seven Yu
     */
    
    public class Info extends Sprite 
    {
        
        private var _index:int = 0;
        
        private var myColor:uint;
        
        public function Info(index:int) 
        {
            super();
			_index = index;
            
            myColor = Math.round(Math.random() * 0xffffff);
            
            initUI();
        }
        
        private function initUI():void
        {
            this.graphics.beginFill(myColor);
            this.graphics.drawCircle(0, 0, 30);
            this.graphics.endFill();
            
            var tf:TextField = new TextField();
            tf.selectable = false;
            tf.autoSize = TextFieldAutoSize.CENTER;
            tf.defaultTextFormat = new TextFormat('consolas', 14);
            tf.x = -30;
            tf.width = 60;
            tf.y = -10;
            tf.text = String(_index);
            addChild(tf);
        }
        
        public function randomMove():void
        {
            this.x = Math.random() * stage.stageWidth;
            this.y = Math.random() * stage.stageHeight;
            
            var vo:InfoVO = new InfoVO(myColor);
            vo.index = _index;
            //vo.color = myColor;
            vo.x = x;
            vo.y = y;
            
            dispatchEvent(new MyEvent(vo, MyEvent.MY_EVENT_TYPE));
        }
        
    }

}