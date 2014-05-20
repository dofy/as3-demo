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
            var a:A = new A();
            
            var b:B = new B();
            var c:C = new C();
            
            a.addObserver(b);
            a.addObserver(c);
            
            a.myName = 'XXX';
            
            a.removeObserver(b);
            
            a.myName = 'NNN';
		}
        
		
	}
	
}