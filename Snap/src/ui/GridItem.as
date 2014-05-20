package ui
{
    import flash.display.Shape;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class GridItem extends Shape
    {
        
        private var size:int;
        
        public function GridItem(size:int)
        {
            this.size = size;
            reset();
        }
        
        /**
         * 重绘
         */
        public function reset():void
        {
            graphics.clear();
            graphics.lineStyle(1, 0xffcc00, 0.8);
            graphics.beginFill(0xffcc00, 0.5);
            graphics.drawRect(0, 0, size, size);
            graphics.endFill();
        }
        
        /**
         * 高亮
         */
        public function highLight():void
        {
            graphics.clear();
            graphics.lineStyle(2, 0x008000, 0.8);
            graphics.beginFill(0x008000, 0.5);
            graphics.drawRect(0, 0, size, size);
            graphics.endFill();
        }
    
    }

}