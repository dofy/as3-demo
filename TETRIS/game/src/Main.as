package
{
    import core.Game;
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var game:Game;
        
        public function Main():void
        {
            game = new Game(20, 20);
            addChild(game);
            
            stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
        }
        
        private function keyDownHandler(e:KeyboardEvent):void
        {
            trace(e.keyCode);
            switch (e.keyCode)
            {
                case 13: // enter
                    game.start();
                    break;
                case 32: // space
                case 38: // up
                case 87: // W
                    game.whirl();
                    break;
                case 40: // down
                case 83: // S
                    game.move(1, 0);
                    break;
                case 37: // left
                case 65: // A
                    game.move(0, -1);
                    break;
                case 39: // right
                case 68: // D
                    game.move(0, 1);
                    break;
                default: 
                    // nothing...
                    break;
            }
        }
    
    }

}