package
{
    import flash.display.DisplayObject;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.geom.Point;
    
    /**
     * 可以修改注册点的容器
     * @author Seven Yu
     */
    public class PSprite extends Sprite
    {
        
        private var _registerPoint:Point;
        private var _localRegisterPoint:Point;
        
        private var _showRegisterPoint:Boolean = false;
        private var registerPointShape:Shape;
        
        public function PSprite()
        {
            super();
            _registerPoint = new Point(0, 0);
        }
        
        public function set localRegisterPoint(point:Point):void
        {
            var len:int = _showRegisterPoint ? this.numChildren - 1 : this.numChildren;
            
            _localRegisterPoint = point;
            
            while (len--)
            {
                var tmpObj:DisplayObject = this.getChildAt(len);
                tmpObj.x -= point.x;
                tmpObj.y -= point.y;
            }
        }
        
        public function get localRegisterPoint():Point
        {
            return _localRegisterPoint;
        }
        
        public function set registerPoint(point:Point):void
        {
            this.localRegisterPoint = globalToLocal(point);
            
            fixGlobalPoint(this, point);
            
            this.x = point.x;
            this.y = point.y;
            
            _registerPoint = point;
        }
        
        private function fixGlobalPoint(obj:DisplayObject, point:Point):void
        {
            if (obj != stage && obj.parent)
            {
                point.x -= obj.parent.x;
                point.y -= obj.parent.y;
                fixGlobalPoint(obj.parent, point);
            }
        }
        
        public function get registerPoint():Point
        {
            return _registerPoint;
        }
        
        public function get showRegisterPoint():Boolean
        {
            return _showRegisterPoint;
        }
        
        public function set showRegisterPoint(value:Boolean):void
        {
            _showRegisterPoint = value;
            value ? showRS() : hideRS();
        }
        
        private function showRS():void
        {
            if (!registerPointShape)
            {
                registerPointShape = new Shape();
                registerPointShape.graphics.lineStyle(1, 0x008000, 0.5);
                registerPointShape.graphics.moveTo(-50, 0);
                registerPointShape.graphics.lineTo(50, 0);
                registerPointShape.graphics.moveTo(0, -50);
                registerPointShape.graphics.lineTo(0, 50);
            }
            addChild(registerPointShape);
        }
        
        private function hideRS():void
        {
            registerPointShape && removeChild(registerPointShape);
        }
    
    }

}