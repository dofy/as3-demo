package utils
{
    import flash.display.DisplayObject;
    import flash.display.Shape;
    import flash.events.Event;
    import flash.events.TimerEvent;
    import flash.geom.Point;
    import flash.utils.Timer;
    import styles.IStyle;
    
    /**
     * ...
     * @author 1209C
     */
    public class Tween
    {
        
        static private var timer:Timer = new Timer(50);
        
        public function Tween()
        {
        
        }
        
        static public function move(target:DisplayObject, style:IStyle):void
        {
            timer.addEventListener(TimerEvent.TIMER, function(e:Event):void
                {
                    var point:Point = style.exec(target.x, target.y);
                    target.x = point.x;
                    target.y = point.y;
                    
                    if (target.x > 800)
                    {
                        target.x = 0;
                    }
                    
                    if (target.y > 600)
                    {
                        target.y = 0;
                    }
                });
            !timer.running && timer.start();
        }
    
    }

}