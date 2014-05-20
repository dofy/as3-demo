package
{
    import boxs.BaseBox;
    import boxs.IBox;
    import flash.display.DisplayObject;
    import flash.display.Shape;
    import flash.display.Sprite;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        public function Main():void
        {
            var box1:BaseBox = BoxFactory1.getBox(BoxFactory1.TYPE_RED);
            randPosition(addChild(box1));
            
            var box2:BaseBox = BoxFactory1.getBox(BoxFactory1.TYPE_GREEN);
            randPosition(addChild(box2));
            
            var box3:IBox = BoxFactory2.getBox(BoxFactory2.TYPE_BLUE);
            randPosition(addChild(box3 as DisplayObject));
            
            var box4:IBox = BoxFactory2.getBox(BoxFactory2.TYPE_YELLOW);
            randPosition(addChild(box4 as DisplayObject));
        }
        
        private function randPosition(box:DisplayObject):void
        {
            box.x = Math.random() * (stage.stageWidth - 100);
            box.y = Math.random() * (stage.stageHeight - 100);
        }
    }

}