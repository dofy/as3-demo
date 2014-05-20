package ui
{
    import flash.display.BitmapData;
    import flash.display.Shape;
    import flash.geom.Matrix;
    import starling.display.Image;
    import starling.textures.Texture;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Ball extends Image
    {
        protected var _xSpeed:Number;
        protected var _ySpeed:Number;
        private var radius:Number;
        private var size:int;
        
        private var bmData:BitmapData;
        
        public function Ball()
        {
            reset();
            super(Texture.fromBitmapData(bmData));
        }
        
        public function reset():void
        {
            var bitmapSize:Number;
            var shape:Shape = new Shape();
            var color:uint = Math.round(Math.random() * 0xffffff);
            size = Math.round(Math.random() * 7) + 3;
            
            radius = size * 5;
            
            with (shape.graphics)
            {
                clear();
                lineStyle(size / 3, color, 0.7);
                beginFill(color, 0.5);
                drawCircle(radius, radius, radius);
                endFill();
            }
            
            bitmapSize = (radius + size / 3) * 2;
            
            bmData = new BitmapData(bitmapSize, bitmapSize, true, 0);
            bmData.draw(shape, new Matrix(1, 0, 0, 1, size / 3, size / 3));
            
            //this.texture = Texture.fromBitmapData(bmData);
            
            initXSpeed();
            initYSpeed();
        }
        
        protected function get newSpeed():Number
        {
            var result:Number = Math.random() * 80 + 20;
            return Math.random() >= 0.5 ? result : result * -1;
        }
        
        protected function initXSpeed():void
        {
            _xSpeed = newSpeed / size;
            trace('x speed:', _xSpeed);
        }
        
        protected function initYSpeed():void
        {
            _ySpeed = newSpeed / size;
            trace('y speed:', _ySpeed);
        }
        
        public function get xSpeed():Number
        {
            return _xSpeed;
        }
        
        public function get ySpeed():Number
        {
            return _ySpeed;
        }
        
        public function negateXSpeed():void
        {
            _xSpeed *= -1;
        }
        
        public function negateYSpeed():void
        {
            _ySpeed *= -1;
        }
    
    }

}