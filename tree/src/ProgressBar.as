package
{
    import flash.display.CapsStyle;
    import flash.display.LineScaleMode;
    import flash.display.Sprite;
    
    /**
     * 进度条
     */
    public class ProgressBar extends Sprite
    {
        // 进度条尺寸常量
        private const BAR_WIDTH:int = 550;
        private const BAR_HEIGHT:int = 10;
        
        // 进度条背景
        private var bg:Sprite;
        // 进度条
        private var bar:Sprite;
        
        public function ProgressBar()
        {
            // 初始化
            bg = new Sprite();
            addChild(bg);
            bg.graphics.beginFill(0xcccccc);
            bg.graphics.drawRect(0, 0, BAR_WIDTH, BAR_HEIGHT);
            bg.graphics.endFill();
            
            bar = new Sprite();
            addChild(bar);
            bar.graphics.beginFill(0x0000ff);
            bar.graphics.drawRect(0, 0, BAR_WIDTH, BAR_HEIGHT);
            bar.graphics.endFill();
        }
        
        /**
         * 刷新进度条
         */
        public function set progress(value:Number):void
        {
            bar.width = BAR_WIDTH * value;
        }
    
    }

}