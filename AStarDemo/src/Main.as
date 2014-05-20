package
{
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import ui.Ball;
    import ui.Map;
    import utils.AStar;
    import utils.Node;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var map:Map;
        private var path:Shape;
        private var ballS:Ball;
        private var ballE:Ball;
        
        public function Main():void
        {
            //stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            map = Map.map;
            addChild(map);
            
            path = new Shape();
            addChild(path);
            
            ballS = new Ball(0xff0000);
            addChild(ballS);
            ballE = new Ball(0x0000ff);
            addChild(ballE);
            
            map.x = path.x = stage.stageWidth - map.width >> 1;
            map.y = path.y = stage.stageHeight - map.height >> 1;
            
            map.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private var flag:Boolean = false;
        private var randS:Point;
        private var randE:Point;
        
        private function clickHandler(e:MouseEvent):void
        {
            var pS:Point, pE:Point;
            flag = !flag;
            if (flag)
            {
                clearTestContent();
                path.graphics.clear();
                //randS = map.randWalkablePoint;
                //randE = map.randWalkablePoint;
                randS = map.pointToGrid(new Point(e.localX, e.localY));
                randS = map.gridToPoint(randS.y, randS.x);
                ballS.x = map.x + randS.x;
                ballS.y = map.y + randS.y;
                //ballE.x = map.x + randE.x;
                //ballE.y = map.y + randE.y;
                ballE.x = ballE.y = 0;
            }
            else
            {
                //trace(e.localX, e.localY);
                randE = map.pointToGrid(new Point(e.localX, e.localY));
                randE = map.gridToPoint(randE.y, randE.x);
                ballE.x = map.x + randE.x;
                ballE.y = map.y + randE.y;
                
                pS = map.pointToGrid(randS);
                pE = map.pointToGrid(randE);
                
                if (pS && pE)
                {
                    var a:AStar = new AStar(map.data, testFunc);
                    drawPath(a.findPath(pS.y, pS.x, pE.y, pE.x));
                }
            }
        }
        
        private function drawPath(pathArr:Array):void
        {
            path.graphics.lineStyle(2, 0x008000);
            for (var i:int = 0, l:int = pathArr.length; i < l; i++)
            {
                var point:Point = map.gridToPoint(pathArr[i].row, pathArr[i].col);
                if (i == 0)
                {
                    path.graphics.moveTo(point.x, point.y);
                }
                else
                {
                    path.graphics.lineTo(point.x, point.y);
                }
            }
        }
        
        private var testTexts:Array = [];
        
        private function testFunc(node:Node):void
        {
            var p1:Point, p2:Point;
            p1 = node.parent ? map.gridToPoint(node.parent.row, node.parent.col) : map.gridToPoint(node.row, node.col);
            p2 = map.gridToPoint(node.row, node.col);
            path.graphics.lineStyle(1);
            path.graphics.moveTo(p1.x, p1.y);
            path.graphics.lineTo(p2.x, p2.y);
            
            var tx:TextField = new TextField();
            tx.autoSize = TextFieldAutoSize.LEFT;
            tx.defaultTextFormat = new TextFormat('verdana', 10);
            tx.textColor = 0xff0000;
            tx.selectable = false;
            //testTexts.push(addChild(tx));
            tx.x = map.x + p2.x + Map.GRID_SIZE / 2;
            tx.y = map.y + p2.y + Map.GRID_SIZE / 2;
            tx.text = 'c:' + node.c.toFixed(2) + '\nf:' + node.f.toFixed(2);
        }
        
        private function clearTestContent():void
        {
            while (testTexts.length)
            {
                removeChild(testTexts.pop());
            }
        }
    
    }

}