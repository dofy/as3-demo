package
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class BulletManager
    {
        
        private static var _self:BulletManager;
        
        private const MAX_NUM:int = 30;
        
        private var bullets:Vector.<Bullet>;
        
        public function BulletManager()
        {
            bullets = new Vector.<Bullet>;
        }
        
        public static function getInstance():BulletManager
        {
            if (!_self)
            {
                _self = new BulletManager();
            }
            return _self;
        }
        
        public function pushBullet(bullet:Bullet):void
        {
            var bullet:Bullet;
            bullets.push(bullet);
            if (bullets.length >= MAX_NUM)
            {
                bullet = bullets.pop();
                if (bullet.parent)
                {
                    bullet.parent.removeChild(bullet);
                    bullet.dispose();
                }
                
            }
        }
        
        public function delBullet(bullet:Bullet):void
        {
            var index:int = bullets.indexOf(bullet);
            if (index > -1)
            {
                bullets.splice(index, 1);
            }
        }
    
    }

}