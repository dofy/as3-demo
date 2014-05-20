package
{
    //import assets.Ball;
    import flash.display.Loader;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.events.ProgressEvent;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.utils.getTimer;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var btn:Sprite;
        private var ll:Loader = new Loader;
        
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
            
            addChild(new Ball(20));
            
            var s1:String = 'a';
            var s2:String;
            var s3:String = 'b';
            var n1:* = s1 && s2;
            var n2:* = s1 || s2;
            var n3:* = s2 && s1 || s3;
            
            trace(n1, n2, n3);
            trace(0 && 2);
            
            return;
            var result:String = '';
            var stra:String = 'addjicnnnfdefffiii';
            var temp:String = '';
            for (var j:int = 0, k:int = stra.length; j < k; j++)
            {
                if (stra.charAt(j) != temp)
                {
                    temp = stra.charAt(j);
                    result += temp;
                }
            }
            trace(result);
            
            var b:Ball = new Ball(20);
            addChild(b);
            b.addEventListener(MouseEvent.CLICK, function(evt:MouseEvent):void
                {
                    //b.play();
                });
            
            return;
            
            new Alpha();
            new Base();
            
            return;
            
            var str:String = 'a';
            var o:Object = new Object();
            o.s = str;
            f(str, o);
            trace(str, o.s);
            function f(s:String, o:Object):void
            {
                s = 'c';
                o.s = 'd';
                o = new Object();
                o.s = 'e';
            }
            
            return;
            addEventListener(Event.ENTER_FRAME, onFrame);
            graphics.lineStyle(1);
            
            graphics.moveTo(0, 80);
            graphics.lineTo(300, 80);
            
            graphics.moveTo(0, 120);
            graphics.lineTo(300, 120);
            
            graphics.moveTo(0, 100);
            
            stage.addEventListener(MouseEvent.RIGHT_CLICK, function(evt:MouseEvent):void
                {
                    trace(999);
                //stage.mouseLock
                });
            
            addChild(ll).y = 50;
            
            btn = new Sprite();
            btn.graphics.beginFill(0);
            btn.graphics.drawRect(0, 0, 100, 30);
            btn.graphics.endFill();
            addChild(btn);
            
            //ll.load(new URLRequest('img.jpg'));
            ll.addEventListener(MouseEvent.CLICK, clickHandler);
            
            btn.addEventListener(MouseEvent.CLICK, click1);
            //btn.addEventListener(MouseEvent.CLICK, click2, false, 999);
            
            var i:int, l:int;
            var red:Array = [305, 284, 315, 301, 296, 282, 307, 298, 269, 278, 278, 288, 302, 298, 267, 282, 311, 308, 282, 300, 290, 293, 271, 267, 282, 322, 292, 277, 279, 313, 277, 310, 252];
            var blue:Array = [99, 96, 102, 83, 106, 102, 90, 86, 117, 95, 113, 103, 102, 102, 99, 101];
            
            var arrRed:Array = [];
            for (i = 0, l = red.length; i < l; i++)
            {
                arrRed.push({'id': i + 1, 'num': red[i]});
            }
            
            trace(JSON.stringify(arrRed.sortOn('num')));
            
            var arrBlue:Array = [];
            for (i = 0, l = blue.length; i < l; i++)
            {
                arrBlue.push({'id': i + 1, 'num': blue[i]});
            }
            
            trace(JSON.stringify(arrBlue.sortOn('num')));
        }
        
        private function onFrame(e:Event):void
        {
            btn.x += 1;
            btn.y = 100 + Math.cos(getTimer() * 0.002) * 20;
            graphics.lineTo(btn.x, btn.y);
            trace(btn.y);
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            ll.load(new URLRequest('img.jpg'));
        }
        
        private function click1(e:MouseEvent):void
        {
            trace(1);
            Tool.gc();
        }
        
        private function click2(e:MouseEvent):void
        {
            trace(2);
            e.stopImmediatePropagation();
        }
    
    }

}