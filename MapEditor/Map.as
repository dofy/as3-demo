package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Map extends Sprite
    {
        
        private var _width:int;
        private var _height:int;
        
        //private var _isDown:Boolean = false;
        
        private var map:Vector.<Vector.<IPlace>>;
        
        public function Map(width:int, height:int)
        {
            _width = width
            _height = height;
            
            initData();
            initMap();
            
            this.addEventListener(Event.ADDED_TO_STAGE, bindEvents);
        }
        
        private function initData():void
        {
            map = new Vector.<Vector.<IPlace>>(_height);
            
            for (var i:int = 0, l:int = map.length; i < l; i++)
            {
                map[i] = new Vector.<IPlace>(_width);
            }
        }
        
        private function initMap():void
        {
            for (var line:Vector.<IPlace>, i:int = 0, l:int = map.length; i < l; i++)
            {
                line = map[i];
                for (var mp:Place, j:int = 0, m:int = line.length; j < m; j++)
                {
                    //mp = new Place(Math.round(Math.random() * 5));
                    mp = new Place();
                    line[j] = mp as IPlace;
                    mp.x = j * mp.width;
                    mp.y = i * mp.height;
                    addChild(mp);
                }
            }
        }
        
        private function bindEvents(e:Event):void
        {
            stage.removeEventListener(Event.ADDED_TO_STAGE, bindEvents);
            
            this.addEventListener(MouseEvent.MOUSE_DOWN, startHandler);
            stage.addEventListener(MouseEvent.MOUSE_UP, cancelHandler);
        }
        
        private function startHandler(e:MouseEvent):void
        {
            //_isDown = true;
            this.addEventListener(MouseEvent.MOUSE_MOVE, setHandler);
            setPlace(e.target);
        }
        
        private function cancelHandler(e:MouseEvent):void
        {
            //_isDown = false;
            this.removeEventListener(MouseEvent.MOUSE_MOVE, setHandler);
        }
        
        private function setHandler(e:MouseEvent):void
        {
            setPlace(e.target);
        }
        
        private function setPlace(target:Object):void
        {
            if (Config.selectedPlace && target is IPlace)
            {
                (target as IPlace).type = Config.selectedPlace.type;
            }
        }
        
        public function get mapData():String
        {
            for (var arr:Array = [], i:int = 0, l:int = map.length; i < l; i++)
            {
                arr.push('[' + map[i].join() + ']');
            }
            
            return '[\n\t' + arr.join(',\n\t') + '\n]';
        }
    }

}