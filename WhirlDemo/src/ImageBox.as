package
{
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import flash.utils.Timer;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class ImageBox extends Sprite
    {
        // ===== 忽略代码 =====
        private var pg:Graphics;
        private var newColor:uint;
        // ===== 忽略代码 =====
        
        private var t:Timer;
        
        private var img:TestImage;
        
        public function ImageBox(pg:Graphics)
        {
            this.addEventListener(Event.ADDED_TO_STAGE, bindEvents);
            
            // ===== 忽略代码 =====
            this.pg = pg;
            // ===== 忽略代码 =====
        }
        
        private function bindEvents(e:Event):void
        {
            this.removeEventListener(Event.ADDED_TO_STAGE, bindEvents);
            
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            stage.addEventListener(MouseEvent.MOUSE_DOWN, downHandler);
            stage.addEventListener(MouseEvent.MOUSE_UP, upHandler);
            
            init();
        }
        
        private function init():void
        {
            // 添加图片
            img = new TestImage();
            addChild(img);
            
            // 旋转计时器
            t = new Timer(100);
            t.addEventListener(TimerEvent.TIMER, onTimer);
            Config.always && t.start();
            
            // ===== 忽略代码 =====
            if (Config.showTip)
            {
                // 绘制容器外框
                var g:Graphics = this.graphics;
                g.lineStyle(1, 0xff0000, 0.3);
                g.drawRect(0, 0, 300, 300);
                // 容器注册点
                g.moveTo(-20, 0);
                g.lineTo(0, 0);
                g.moveTo(0, -20);
                g.lineTo(0, 0);
            }
            // ===== 忽略代码 =====
        }
        
        private function downHandler(e:MouseEvent):void
        {
            var globalX:int = e.stageX;
            var globalY:int = e.stageY;
            
            // ==========================================================
            // 注意: 先移动图片, 再移动容器, 因为要先进行 globalToLocal 转换
            // ==========================================================
            
            // step 1:
            // 获得鼠标点击位置
            var point:Point = new Point(globalX, globalY);
            // 将点的全局坐标(场景中的坐标)转换为容器内的坐标
            point = globalToLocal(point);
            // 为图片设置新的注册点
            setPoint(point.x, point.y);
            
            // step 2:
            // 移动整个容器
            this.x = globalX;
            this.y = globalY;
            
            // 开始旋转
            t.start();
            
            // ===== 忽略代码 =====
            if (Config.showTip)
            {
                // 绘制当前注册点
                newColor = Math.round(Math.random() * 0xffffff);
                pg.lineStyle(3, newColor, 0.3);
                pg.moveTo(globalX - 20, globalY);
                pg.lineTo(globalX + 20, globalY);
                pg.moveTo(globalX, globalY - 20);
                pg.lineTo(globalX, globalY + 20);
            }
            // ===== 忽略代码 =====
        }
        
        /**
         * 停止旋转
         * @param e
         */
        private function upHandler(e:MouseEvent):void
        {
            !Config.always && t.stop();
        }
        
        /**
         * 为图片设置新的坐标点
         * @param offsetX
         * @param offsetY
         */
        public function setPoint(offsetX:int, offsetY:int):void
        {
            // 新坐标点 = 原始坐标 - 偏移量
            img.x -= offsetX;
            img.y -= offsetY;
        }
        
        private function onTimer(e:TimerEvent):void
        {
            Config.whirl && (this.rotation += 5);
            
            // ===== 忽略代码 =====
            if (Config.showTip)
            {
                // 测试代码, 绘制出运行轨迹
                var p:Point = new Point(img.x, img.y);
                p = localToGlobal(p);
                
                pg.lineStyle();
                pg.beginFill(newColor, 0.3);
                pg.drawCircle(p.x, p.y, 3);
                pg.endFill();
            }
            // ===== 忽略代码 =====
        }
    
    }

}