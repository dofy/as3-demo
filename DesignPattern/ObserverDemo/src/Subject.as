package  
{
	/**
     * ...
     * @author 1209C
     */
    public class Subject 
    {
        
        private var _observers:Vector.<Observer>;
        
        public function Subject() 
        {
            _observers = new Vector.<Observer>;
        }
        
        public function addObserver(observer:Observer):void
        {
            removeObserver(observer);
            _observers.push(observer);
        }
        
        public function removeObserver(observer:Observer):void
        {
            var index:int = _observers.indexOf(observer);
            if (index !== -1)
            {
                _observers.splice(index, 1);
            }
        }
        
        protected function notify():void
        {
            for each (var observer:Observer in _observers)
            {
                observer.update();
            }
        }
    }

}