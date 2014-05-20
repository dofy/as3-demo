package
{
    import assets.MyButton;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.net.LocalConnection;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        private var lc:LocalConnection;
        private var bu:MyButton;
        private var br:MyButton;
        private var bd:MyButton;
        private var bl:MyButton;
        
        public function Main()
        {
            initUI();
            initConnection();
        }
        
        private function initUI():void
        {
            bu = new MyButton;
            br = new MyButton;
            bd = new MyButton;
            bl = new MyButton;
            
            bu.x = bd.x = 150;
            bl.y = br.y = 150;
            
            bu.y = 50;
            bd.y = 250;
            
            bl.x = 50;
            br.x = 250;
            
            addChild(bu);
            addChild(br);
            addChild(bd);
            addChild(bl);
            
            bu.addEventListener(MouseEvent.CLICK, clickHandler);
            br.addEventListener(MouseEvent.CLICK, clickHandler);
            bd.addEventListener(MouseEvent.CLICK, clickHandler);
            bl.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            switch (e.currentTarget)
            {
                case bu: 
                    lc.send('LCDemo', 'move', 0, -10);
                    break;
                case br: 
                    lc.send('LCDemo', 'move', 10, 0);
                    break;
                case bd: 
                    lc.send('LCDemo', 'move', 0, 10);
                    break;
                case bl: 
                    lc.send('LCDemo', 'move', -10, 0);
                    break;
                default: 
                    break;
            }
        }
        
        private function initConnection():void
        {
            lc = new LocalConnection();
        }
    
    }

}