package utils
{
    import flash.display.Graphics;
    import flash.geom.Point;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Draw
    {
        public function Draw()
        {
        
        }
        
        public static function draw3(graphic:Graphics, x:Number, y:Number, leng:Number, rotation:Number = 0):void
        {
            var r:Number = leng / 2 / Math.cos(30);
            
            var p1:Point = getPoint(rotation + 0, r);
            var p2:Point = getPoint(rotation + 120, r);
            var p3:Point = getPoint(rotation - 120, r);
            
            graphic.lineStyle(1);
            graphic.moveTo(p1.x, p1.y);
            graphic.lineTo(p2.x, p2.y);
            graphic.lineTo(p3.x, p3.y);
            graphic.lineTo(p1.x, p1.y);
        }
        
        private static function getPoint(r:Number, leng:Number):Point
        {
            var point:Point;
            var px:int = 1;
            var py:int = 1;
            
            r %= 360;
            if (r < 0)
            {
                r += 360;
            }
            
            if (r == 0)
            {
                point = new Point(leng, 0);
            }
            else if (r > 0 && r < 90)
            {
                point = new Point(leng * Math.cos(r) * px, leng * Math.sin(r) * py);
            }
            else if (r == 90)
            {
                point = new Point(0, leng);
            }
            else if (r > 90 && r < 180)
            {
                r %= 90;
                px = -1;
                
                point = new Point(leng * Math.sin(r) * px, leng * Math.cos(r) * py);
            }
            else if (r == 180)
            {
                point = new Point(-leng, 0);
            }
            else if (r > 180 && r < 270)
            {
                r %= 90;
                px = py = -1;
                point = new Point(leng * Math.cos(r) * px, leng * Math.sin(r) * py);
            }
            else if (r == 270)
            {
                point = new Point(0, -leng);
            }
            else
            {
                r %= 90;
                py = -1;
                point = new Point(leng * Math.sin(r) * px, leng * Math.cos(r) * py);
            }
            
            return point;
        }
    
    }

}