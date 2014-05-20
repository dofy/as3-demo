package nicegame.assets
{

	import flash.display.MovieClip;
    import flash.events.MouseEvent;


	public class PlayerPanel extends MovieClip
	{


		public function PlayerPanel()
		{
            btnPlay.addEventListener(MouseEvent.CLICK, onButtonClick);
            btnPause.addEventListener(MouseEvent.CLICK, onButtonClick);
			
			btnPause.y += 50;
		}
        
        private function onButtonClick(e:MouseEvent):void 
        {
            trace('in panel:', e.target.buttonType);
        }
	}

}