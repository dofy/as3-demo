package
{

	import flash.display.MovieClip;


	public class Tree extends MovieClip
	{


		public function Tree()
		{
			// constructor code
			var kind1: Kind, kind2: Kind, kind3: Kind;
			kind1 = new Kind(10);
			addChild(kind1);
			kind1.x = 300;
			kind1.y = 400;

			kind2 = new Kind(20);
			addChild(kind2);
			kind2.x = 150;
			kind2.y = 400;

			kind3 = new Kind(15);
			addChild(kind3);
			kind3.x = 450;
			kind3.y = 400;
		}
	}

}