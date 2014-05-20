package 
{
    import demo.Robot1;
    import demo.Robot2;
    import flash.display.Sprite;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
            
            var r1:Robot1 = new Robot1(7);
            r1.talk();
            r1.fly();
            r1.walk();
            
            var r2:Robot2 = new Robot2(0xffcc00);
            r2.talk();
            r2.run();
            r2.walk();
            r2.hide();
            r2.show();
		}
		
	}
	
}