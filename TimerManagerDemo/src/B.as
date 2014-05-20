package
{
    import flash.display.Sprite;
    import flash.filters.GlowFilter;
    import managers.TimerManager;
    
    /**
     * ...
     * @author 1209C
     */
    public class B extends Sprite
    {
        
        public function B()
        {
            this.graphics.beginFill(0x008000);
            this.graphics.drawRect(0, 0, 30, 40);
            this.graphics.endFill();
            
            TimerManager.manager.addHandler(walk);
            TimerManager.manager.addHandler(flash, 30);
        }
        
        public function walk():void
        {
            this.x += 5;
            
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
                TimerManager.manager.removeHandler(flash);
            }
            else
            {
                this.filters = [new GlowFilter(0xffcc00, 1, 16, 16)];
            }
        }
    
    }

}