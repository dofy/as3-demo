package nicegame.demo.view.components 
{
	import flash.display.Sprite;
    import nicegame.demo.utils.ColorTool;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Hero extends Sprite 
    {
        
        public function Hero() 
        {
            super();
			initUI();
        }
        
        private function initUI():void 
        {
            graphics.lineStyle(3, ColorTool.random);
            graphics.beginFill(ColorTool.random);
            graphics.drawCircle(0, 0, 30);
            graphics.endFill();
        }
        
    }

}