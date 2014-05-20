package nicegame.demo.events
{
    import flash.events.Event;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class AppEvent extends Event
    {
        
        public static const BTN_START:String = 'btn_start';
        public static const BTN_HELP:String = 'btn_help';
        public static const BTN_SETTINGS:String = 'btn_settings';
        
        public static const BTN_EXIT:String = 'btn_exit';
        public static const BTN_CLOSE:String = 'btn_close';
        
        public static const CHANGED:String = 'changed';
        
        private var _data:Object;
        
        public function AppEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false)
        {
            super(type, bubbles, cancelable);
            _data = data;
            /**
             * 1b9b55a5-0c7b-4ece-a025-a890eca2a8cb
             * d73c88f1-e449-49b3-bfe8-c5597f600252
             * c3d83b9c-8ff6-4d9e-8d2c-d36b30d4e976
             * 04961050-1607-4bf4-972f-2daa121c341b
             */
        }
        
        public override function clone():Event
        {
            return new AppEvent(type, _data, bubbles, cancelable);
        }
        
        public override function toString():String
        {
            return formatToString("AppEvent", "data", "type", "bubbles", "cancelable", "eventPhase");
        }
        
        public function get data():Object
        {
            return _data;
        }
    
    }

}