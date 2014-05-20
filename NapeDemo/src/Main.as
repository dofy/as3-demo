package
{
    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.geom.Rectangle;
    import flash.ui.Keyboard;
    
    import nape.geom.AABB;
    import nape.geom.GeomPoly;
    import nape.geom.GeomPolyList;
    import nape.geom.Vec2;
    import nape.phys.Body;
    import nape.phys.BodyList;
    import nape.phys.BodyType;
    import nape.phys.Material;
    import nape.shape.Circle;
    import nape.shape.Polygon;
    import nape.shape.Shape;
    import nape.space.Space;
    import nape.util.BitmapDebug;
    import nape.util.ShapeDebug;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        // nape 中的物理世界
        private var napeWorld:Space;
        
        // 用来显示测试图形
        private var debug:ShapeDebug;
        //private var debug:BitmapDebug;
        
        // 运动系数(摩擦力, 弹力...)
        private var m:Material;
        
        private var isShift:Boolean = false;
        private var isCtrl:Boolean = false;
        
        // 多边形定点列表
        private var vec2List:Vector.<Vec2>;
        private var curPoint:Point;
        private var prePoint:Point;
        
        // 用于显示绘制自由图形的线条
        private var drawArea:Sprite;
        
        public function Main():void
        {
            
            // 空间
            napeWorld = new Space(new Vec2(0, 600));
            
            // 运动系数
            //m = new Material(0.5);
            //m = Material.rubber(); // 橡胶
            //m = Material.ice(); // 冰
            //m = Material.wood(); // 木头
            m = Material.steel(); // 金属
            
            // 模拟
            debug = new ShapeDebug(800, 600);
            //debug = new BitmapDebug(800, 600);
            
            addChild(debug.display);
            
            // 绘制初始物体
            initBodies();
            
            stage.mouseChildren = false;
            stage.addEventListener(Event.ENTER_FRAME, onFrame);
            stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
            stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
            stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
            stage.addEventListener(MouseEvent.MOUSE_UP, mouseHandler);
            
            // 绘图层
            drawArea = new Sprite();
            addChild(drawArea);
        }
        
        /**
         * 绘制初始物体
         */
        private function initBodies():void
        {
            // 盒子
            drawBox(400, 580, 400, 10, BodyType.STATIC);
            drawBox(100, 400, 10, 400, BodyType.STATIC, -0.5);
            drawBox(700, 400, 10, 400, BodyType.STATIC, 0.5);
            
            // 动态物体
            drawBall(300, 480, 25, BodyType.DYNAMIC);
            drawBox(300, 540, 50, 50, BodyType.DYNAMIC);
            drawBox(500, 510, 50, 100, BodyType.DYNAMIC);
            drawBox(400, 430, 300, 30, BodyType.DYNAMIC);
            
            drawBox(300, 330, 50, 120, BodyType.DYNAMIC);
            drawBox(500, 370, 50, 60, BodyType.DYNAMIC);
            drawBox(500, 300, 50, 60, BodyType.DYNAMIC);
            drawBox(400, 240, 450, 30, BodyType.DYNAMIC);
            drawBall(400, 330, 40, BodyType.DYNAMIC);
            
            drawBox(400, 110, 230, 30, BodyType.DYNAMIC);
            drawBall(330, 170, 30, BodyType.DYNAMIC);
        }
        
        private function onKeyDown(e:KeyboardEvent):void
        {
            isCtrl = e.ctrlKey;
            isShift = e.shiftKey;
            if (e.keyCode == Keyboard.R)
            {
                while (numChildren > 2)
                {
                    removeChildAt(0);
                }
                napeWorld.clear();
                initBodies();
            }
        }
        
        private function onKeyUp(e:KeyboardEvent):void
        {
            isCtrl = false;
            isShift = false;
        }
        
        /**
         * 对物理世界的运算刷新
         * @param e
         */
        private function onFrame(e:Event):void
        {
            napeWorld.step(1 / 60);
            //debug.clear();
            //debug.draw(napeWorld);
            //debug.flush();
            
            for (var i:int = 0; i < napeWorld.liveBodies.length; i++)
            {
                //2.遍历这个BodyList对象，并通过BodyList.at(index)方法获取每个刚体的引用，同时获取贴图对象引用
                var body:Body = napeWorld.liveBodies.at(i);
                var graphic:DisplayObject = body.userData.graphic;
                //3.用刚体的坐标和角度更新贴图的属性，实时更新贴图
                graphic.x = body.position.x;
                graphic.y = body.position.y;
                graphic.rotation = (body.rotation * 180 / Math.PI) % 360;
            }
        
        }
        
        private function mouseHandler(e:MouseEvent):void
        {
            switch (e.type)
            {
                // 鼠标按下时, 记录当前点, 用于绘制自由多边形
                case MouseEvent.MOUSE_DOWN: 
                    vec2List = new Vector.<Vec2>();
                    curPoint = new Point(e.stageX, e.stageY);
                    prePoint = curPoint.clone();
                    drawArea.graphics.lineStyle(2, Color.randColor);
                    drawArea.graphics.beginFill(Color.randColor);
                    drawArea.graphics.moveTo(curPoint.x, curPoint.y);
                    vec2List.push(new Vec2(curPoint.x, curPoint.y));
                    
                    stage.addEventListener(MouseEvent.MOUSE_MOVE, mouseHandler);
                    break;
                // 鼠标弹起, 决定执行动作
                case MouseEvent.MOUSE_UP:
                    
                    // 按下ctrl点击, 删除物体
                    if (isCtrl)
                    {
                        // 获取当前鼠标点下的所有物体
                        var list:BodyList = napeWorld.bodiesUnderPoint(new Vec2(e.stageX, e.stageY));
                        // 遍历移除(只移除动态物体)
                        list.foreach(function(bb:Body):void
                            {
                                if (bb.isDynamic())
                                {
                                    removeChild(bb.userData.graphic);
                                    napeWorld.bodies.remove(bb);
                                }
                            });
                    }
                    // 绘制了自由图形
                    else if (vec2List.length > 1)
                    {
                        try
                        {
                            var bb:Body = new Body();
                            // 根据定点坐标数组获取多边形
                            var gp:GeomPoly = new GeomPoly(vec2List);
                            // 将多边形分解成多个小的凸多边形
                            var shapeList:GeomPolyList = gp.convexDecomposition();
                            drawArea.graphics.endFill();
                        }
                        catch (e:Error)
                        {
                            trace(e);
                        }
                        finally
                        {
                            if (shapeList)
                            {
                                // 将图形添加到物体中
                                shapeList.foreach(function(shape:*):void
                                    {
                                        bb.shapes.add(new Polygon(shape, m));
                                    });
                                
                                var lc:Vec2 = bb.localCOM;
                                
                                // 贴图
                                var userData:Sprite = new Sprite();
                                //userData.graphics.copyFrom(drawArea.graphics);
                                
                                var bounds:Rectangle = drawArea.getBounds(stage);
                                
                                userData.graphics.beginFill(0, 0.3);
                                userData.graphics.drawRect(lc.x - bounds.width / 2, lc.y - bounds.height / 2, bounds.width, bounds.height);
                                userData.graphics.endFill();
                                
                                //var bm:Bitmap=new Bitmap(
                                addChildAt(userData, 0);
                                // 重新计算大多边形重心
                                bb.align();
                                
                                bb.userData.graphic = userData;
                                bb.space = napeWorld;
                            }
                        }
                    }
                    // 随机绘制一个矩形或圆形物体
                    else
                    {
                        if (Math.random() > 0.5)
                        {
                            // 绘制圆形
                            drawBall(e.stageX, e.stageY, Math.random() * 20 + 30, BodyType.DYNAMIC);
                        }
                        else
                        {
                            // 绘制矩形
                            drawBox(e.stageX, e.stageY, Math.random() * 100 + 50, Math.random() * 100 + 50, BodyType.DYNAMIC);
                        }
                    }
                    drawArea.graphics.clear();
                    stage.removeEventListener(MouseEvent.MOUSE_MOVE, mouseHandler);
                    break;
                // 鼠标移动, 绘制自由图形
                case MouseEvent.MOUSE_MOVE: 
                    //curPoint = new Point(e.stageX, e.stageY);
                    //drawArea.graphics.lineTo(curPoint.x, curPoint.y);
                    //if (Point.distance(curPoint, prePoint || curPoint.clone()) > 10)
                    //{
                        //vec2List.push(new Vec2(curPoint.x, curPoint.y));
                        //prePoint = curPoint.clone();
                    //}
                    break;
                default: 
                    // nothing...
                    break;
            }
        }
        
        private function drawBox(posX:Number, posY:Number, w:Number, h:Number, type:BodyType, rotate:Number = 0):Body
        {
            var userData:Sprite = new Sprite();
            addChildAt(userData, 0);
            
            var box:Body = new Body(type, new Vec2(posX, posY));
            var boxShape:Polygon = new Polygon(Polygon.box(w, h), m);
            boxShape.rotate(rotate);
            box.shapes.add(boxShape);
            box.space = napeWorld;
            
            userData.graphics.lineStyle(2, Color.randColor);
            userData.graphics.beginFill(Color.randColor);
            userData.graphics.drawRect(-w / 2, -h / 2, w, h);
            userData.graphics.endFill();
            userData.x = box.position.x;
            userData.y = box.position.y;
            userData.rotation = (rotate * 180 / Math.PI) % 360;
            
            box.userData.graphic = userData;
            
            return box;
        }
        
        private function drawBall(posX:Number, posY:Number, radius:Number, type:BodyType):Body
        {
            var userData:Sprite = new Sprite();
            addChildAt(userData, 0);
            
            var ball:Body = new Body(type, new Vec2(posX, posY));
            var ballShape:Circle = new Circle(radius, null, m);
            ball.shapes.add(ballShape);
            ball.space = napeWorld;
            
            userData.graphics.lineStyle(2, Color.randColor);
            userData.graphics.beginFill(Color.randColor);
            userData.graphics.drawCircle(0, 0, radius);
            userData.graphics.endFill();
            userData.x = ball.position.x;
            userData.y = ball.position.y;
            
            ball.userData.graphic = userData;
            
            return ball;
        }
    
    }

}