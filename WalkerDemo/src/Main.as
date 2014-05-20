package
{
    import com.nicegame.motion.Dir;
    import com.nicegame.motion.WalkerBase;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var keyCount:int = 0;
        
        private var _keyLeft:Boolean = false;
        private var _keyUp:Boolean = false;
        private var _keyRight:Boolean = false;
        private var _keyDown:Boolean = false;
        
        private var _keyShift:Boolean = false;
        
        private var walker:WalkerBase;
        
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
            
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            
            stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
            
            walker = new WalkerBase('assets/1.png');
            addChild(walker);
            
            walker.x = 100;
            walker.y = 300;
        }
        
        private function onKeyDown(e:KeyboardEvent):void
        {
            _keyShift = e.shiftKey;
            switch (e.keyCode)
            {
                case 37: 
                    if (!_keyLeft)
                    {
                        _keyLeft = true;
                        keyCount += Dir.KEY_LEFT;
                    }
                    break;
                case 38: 
                    if (!_keyUp)
                    {
                        _keyUp = true;
                        keyCount += Dir.KEY_UP;
                    }
                    break;
                case 39: 
                    if (!_keyRight)
                    {
                        _keyRight = true;
                        keyCount += Dir.KEY_RIGHT;
                    }
                    break;
                case 40: 
                    if (!_keyDown)
                    {
                        _keyDown = true;
                        keyCount += Dir.KEY_DOWN;
                    }
                    break;
                default: 
                    break;
            }
            
            check();
        }
        
        private function onKeyUp(e:KeyboardEvent):void
        {
            _keyShift = e.shiftKey;
            switch (e.keyCode)
            {
                case 37: 
                    _keyLeft = false;
                    keyCount -= Dir.KEY_LEFT;
                    break;
                case 38: 
                    _keyUp = false;
                    keyCount -= Dir.KEY_UP;
                    break;
                case 39: 
                    _keyRight = false;
                    keyCount -= Dir.KEY_RIGHT;
                    break;
                case 40: 
                    _keyDown = false;
                    keyCount -= Dir.KEY_DOWN;
                    break;
                default: 
                    break;
            }
            
            check();
        }
        
        private function check():void
        {
            var dir:int = Dir.key2dir(keyCount);
            
            if (dir == Dir.DIR_STOP)
            {
                walker.stop();
            }
            else
            {
                if (_keyShift)
                {
                    walker.run(dir);
                }
                else
                {
                    walker.walk(dir);
                }
            }
        }
    
    }

}