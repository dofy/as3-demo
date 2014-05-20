package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import managers.TimerManager;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var tm:TimerManager = TimerManager.getInstance();
        
        public function Main():void
        {
            if (stage)
                init();
            else
                addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // entry point
            
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
            
            
            // test 1
            
            trace(StrTool.format('int string int_456_int'));
            
            return;
            
            tm.autoStart = false;
            
            var t:TextField = new TextField();
            t.defaultTextFormat = new TextFormat('consolas', 14, 0xcccccc);
            t.selectable = false;
            t.autoSize = TextFieldAutoSize.LEFT;
            t.text = 'Press any key to change speed, Click to Play or Stop.';
            addChild(t);
            
            addChild(new A()).y = 100;
            addChild(new B()).y = 200;
        }
        
        private function keyHandler(e:KeyboardEvent):void
        {
            tm.speed = tm.speed == 2 ? 1 : 2;
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            tm.running ? tm.stop() : tm.statr();
        }
    
    }

}