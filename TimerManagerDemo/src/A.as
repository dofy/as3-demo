package
{
    import flash.display.Sprite;
    import flash.filters.GlowFilter;
    import managers.TimerManager;
    
    /**
     * ...
     * @author 1209C
     */
    public class A extends Sprite
    {
        
        public function A()
        {
            this.graphics.beginFill(0x008000);
            this.graphics.drawCircle(0, 0, 30);
            this.graphics.endFill();
            
            TimerManager.manager.addHandler(walk);
            TimerManager.manager.addHandler(flash, 40);
        }
        
        public function walk():void
        {
            this.x += 3;
            
            if (this.x > stage.stageWidth)
            {
                this.x = 0;
            }
        }
        
        public function flash():void
        {
            if (this.filters.length > 0)
            {
                this.filters = [];
            }
            else
            {
                this.filters = [new GlowFilter(0xffcc00, 1, 16, 16)];
            }
        }
    
    }

}