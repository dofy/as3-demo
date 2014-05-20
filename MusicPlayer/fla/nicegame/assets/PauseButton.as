package nicegame.assets
{
    
    import nicegame.ui.ButtonBase;
    
    public class PauseButton extends ButtonBase
    {
        
        public function PauseButton()
        {
            // constructor code
            super();
        }
        
        public function get buttonType():String
        {
            return 'pause button';
        }
    }

}
