package nicegame.demo.view.pages
{
    import fla.assets.BtnExit;
    import fla.assets.BtnHelp2;
    import fla.assets.BtnSettings2;
    import fla.assets.LblGamePage;
    import flash.events.MouseEvent;
    import flash.ui.Keyboard;
    import nicegame.demo.events.AppEvent;
    import nicegame.demo.view.components.Hero;
    
    /**
     * 游戏页面
     * @author Seven Yu
     */
    public class GamePage extends BasePage
    {
        
        public var speed:int;
        
        private var btnSettings:BtnSettings2;
        private var btnHelp:BtnHelp2;
        private var btnExit:BtnExit;
        private var hero:Hero;
        
        override protected function initUI():void
        {
            super.initUI();
            
            addChild(new LblGamePage);
            
            btnSettings = addChild(new BtnSettings2) as BtnSettings2;
            btnSettings.addEventListener(MouseEvent.CLICK, clickHandler);
            btnSettings.x = 500;
            btnSettings.y = 10;
            
            btnHelp = addChild(new BtnHelp2) as BtnHelp2;
            btnHelp.addEventListener(MouseEvent.CLICK, clickHandler);
            btnHelp.x = 630;
            btnHelp.y = 10;
            
            btnExit = addChild(new BtnExit) as BtnExit;
            btnExit.addEventListener(MouseEvent.CLICK, clickHandler);
            btnExit.x = 720;
            btnExit.y = 10;
        }
        
        public function reset():void
        {
            hero = addChildAt(new Hero(), 0) as Hero;
            hero.x = Math.floor((Math.random() * (800 - 60)) / 10) * 10 + 30;
            hero.y = Math.floor((Math.random() * (600 - 60)) / 10) * 10 + 30;
            trace(hero.x, hero.y);
        }
        
        public function dispose():void
        {
            if (hero)
            {
                removeChild(hero);
            }
        }
        
        public function move(dir:int):void
        {
            var xStep:int, yStep:int;
            switch (dir)
            {
                case Keyboard.UP: 
                case Keyboard.W: 
                    yStep = -speed;
                    break;
                case Keyboard.RIGHT: 
                case Keyboard.D: 
                    xStep = speed;
                    break;
                case Keyboard.DOWN: 
                case Keyboard.S: 
                    yStep = speed;
                    break;
                case Keyboard.LEFT: 
                case Keyboard.A: 
                    xStep = -speed;
                    break;
            }
            hero.x += xStep;
            hero.y += yStep;
            if (hero.x > 800 - 30)
            {
                hero.x = 30 + (hero.x - (800 - 30));
            }
            else if (hero.x < 30)
            {
                hero.x = 800 - 30 - (30 - hero.x);
            }
            
            if (hero.y > 600 - 30)
            {
                hero.y = 30 + (hero.y - (600 - 30));
            }
            else if (hero.y < 30)
            {
                hero.y = 600 - 30 - (30 - hero.y);
            }
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            switch (e.currentTarget)
            {
                case btnSettings: 
                    dispatchEvent(new AppEvent(AppEvent.BTN_SETTINGS));
                    break;
                case btnHelp: 
                    dispatchEvent(new AppEvent(AppEvent.BTN_HELP));
                    break;
                case btnExit: 
                    dispatchEvent(new AppEvent(AppEvent.BTN_EXIT));
                    break;
            }
        }
    
    }

}