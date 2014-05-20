package
{
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main2 extends Sprite
    {
        private var box:PSprite;
        
        public function Main2()
        {
            //mouseChildren = false;
            
            var x:Sprite = new Sprite();
            addChild(x);
            x.x = 100;
            x.y = 150;
            
            var img:TestImage = new TestImage();
            //img.x = 10;
            //img.y = 10;
            
            box = new PSprite();
            box.addChild(img);
            x.addChild(box);
            
            box.localRegisterPoint = new Point(10, 10);
            
            trace(box.x, box.y);
            
            box.showRegisterPoint = true;
            
            stage.addEventListener(Event.ENTER_FRAME, onFrame);
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private function onFrame(e:Event):void
        {
            box.rotation += 5;
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            box.registerPoint = new Point(e.stageX, e.stageY);
            //box.localRegisterPoint = new Point(50, 50);
            trace(box.localRegisterPoint);
        }
    
    }

}