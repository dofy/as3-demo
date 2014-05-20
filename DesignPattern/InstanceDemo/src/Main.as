package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 1209C
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
            var s1:Test = new Test();
            var s2:Test = new Test();
            
            var s3:InstanceTest = InstanceTest.instance;
            var s4:InstanceTest = InstanceTest.instance;
            
            //var s5:InstanceTest = new InstanceTest();
            
            trace('s1 trace...');
            s1.test();
            s1.test();
            s1.test();
            s1.test();
            /*
            trace('s2 trace...');
            s2.test();
            s2.test();
            s2.test();
            s2.test();
            s2.test();
            */
            
            trace('s3....');
            s3.test();
            s3.test();
            s3.test();
            s3.test();
            trace('s4....');
            s4.test();
            s4.test();
            s4.test();
            s4.test();
            s4.test();
            //trace('s5....');
            //s5.test();
            
            InstanceTest.instance.test();
            
            InstanceTest.getInstance().test();
            
            //InstanceTest.
		}
		
	}
	
}