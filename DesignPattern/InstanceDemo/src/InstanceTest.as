package
{
    
    /**
     * ...
     * @author 1209C
     */
    public class InstanceTest
    {
        
        private var s:int = 0;
        
        static private var _instance:InstanceTest;
        
        public function InstanceTest(xx:XX = null)
        {
            if (xx == null)
            {
                throw new Error('请使用 getInstance() 方法获取单例.');
            }
        }
        
        static public function getInstance():InstanceTest
        {
            if (_instance == null)
            {
                _instance = new InstanceTest(new XX);
            }
            return _instance;
        }
        
        static public function get instance():InstanceTest
        {
            if (_instance == null)
            {
                _instance = new InstanceTest(new XX);
            }
            return _instance;
        }
        
        public function test():void
        {
            s++;
            trace(s);
        }
    
    }

}

class XX
{
}