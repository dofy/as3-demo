package core
{
    import flash.display.Sprite;
    import flash.geom.Point;
    import flash.utils.Dictionary;
    import ui.Ball;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Game extends Sprite
    {
        
        // 出生点
        private var birthPoint:Point;
        // 球集合
        private var balls:Dictionary;
        
        public function Game()
        {
            super();
            
            birthPoint = new Point(400, 500);
            balls = new Dictionary();
        }
        
        /**
         * 添加球
         * @param id
         * @param color
         * @return
         */
        public function addBall(id:String, color:uint = 0):Ball
        {
            var ball:Ball = new Ball(id, color);
            balls[id] = ball;
            addChild(ball);
            ball.x = birthPoint.x;
            ball.y = birthPoint.y;
            return ball;
        }
        
        /**
         * 移除球
         * @param id
         */
        public function removeBall(id:String):void
        {
            balls[id] && removeChild(balls[id]);
            delete balls[id];
        }
        
        /**
         * 移动指定球
         * @param id
         * @param offset
         * @return
         */
        public function move(id:String, offset:Point):Ball
        {
            var ball:Ball = balls[id];
            if (ball)
            {
                ball.x += offset.x;
                ball.y += offset.y;
            }
            return ball;
        }
        
        /**
         * 将球移动至
         * @param id
         * @param point
         * @return
         */
        public function moveTo(id:String, point:Point):Ball
        {
            var ball:Ball = balls[id];
            if (ball)
            {
                ball.x = point.x;
                ball.y = point.y;
            }
            return ball;
        }
    
    }

}