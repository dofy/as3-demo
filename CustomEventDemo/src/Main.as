package
{
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.utils.setTimeout;
    
    import nicegame.demo.Info;
    import nicegame.events.MyEvent;
    import nicegame.vo.InfoVO;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var balls:Array = [];
        
        public function Main():void
        {
            if (stage)
                init();
            else
                addEventListener(Event.ADDED_TO_STAGE, init);
        }
        
        private function init(e:Event = null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, init);
            // entry point
			
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            for (var i:int = 0; i < 15; i++)
            {
                var info:Info = new Info(i);
                balls.push(info);
                addChild(info);
                info.x = i * 70 + 100;
                info.y = 100;
                
                info.addEventListener(MyEvent.MY_EVENT_TYPE, myEventHandler);
            }
            
            stage.addEventListener(MouseEvent.CLICK, onClick);
        }
        
        private function myEventHandler(e:MyEvent):void
        {
            trace(e);
            var iVO:InfoVO = e.data;
            
            trace('index:', iVO.index, 'color:', iVO.color);
            
            //with (this.graphics)
            //{
                //clear();
                //lineStyle(1, iVO.color);
                //drawCircle(iVO.x, iVO.y, 40);
            //}
            var g:Graphics = this.graphics;
            g.clear();
            g.lineStyle(1, iVO.color);
            g.drawCircle(iVO.x, iVO.y, 40);
            
            setTimeout(function(g:Graphics):void
                {
                    g.clear();
                }, 500, g);
        }
        
        private function onClick(e:MouseEvent):void
        {
            var i:int = Math.floor(Math.random() * balls.length);
            (balls[i] as Info).randomMove();
        }
    
    }

}