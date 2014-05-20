package
{
    import components.Ball;
    import flash.display.Sprite;
    import flash.events.Event;
    import styles.Normal;
    import styles.Random;
    import utils.Tween;
    
    /**
     * ...
     * @author 1209C
     */
    public class Main extends Sprite
    {
        
        public function Main():void
        {
            var a:int, b:int, c:int;
            var ballA:Ball = new Ball();
            var ballB:Ball = new Ball();
            
            addChild(ballA).y = 100;
            addChild(ballB).y = 200;
            
            Tween.move(ballA, new Normal);
            Tween.move(ballB, new Random);
            
            //trace(true && false && 5);
            //trace(false || undefined || 5);
            // false 0 null undefined
            
            return;
            
            var arr:Array = [{n: 1}, {n: 2, x: {t: 3, y: {u: 'uuu'}}, m: 'mmm'}, {n: 3}];
            showObj(arr);
            //trace(JSON.stringify(arr));
        }
        
        // TODO asdf
        private function showObj(obj:Object, level:int = 0):void
        {
            // FIXME asdfsadf
            for (var key:String in obj)
            {
                if (typeof obj[key] == 'object')
                {
                    trace(new Array(level).join(' '), key, ':');
                    showObj(obj[key], level + 1);
                }
                else
                {
                    trace(new Array(level).join(' '), key, ':', obj[key]);
                }
            }
        }
    
    }

}