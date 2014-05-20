package ui
{
    import configs.UIConfig;
    import flash.display.Graphics;
    import flash.display.Shape;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Background extends Shape
    {
        private var rows:int;
        private var cols:int;
        
        public function Background(rows:int, cols:int)
        {
            this.rows = rows;
            this.cols = cols;
            
            initUI();
        }
        
        private function initUI():void
        {
            var g:Graphics = this.graphics
            
            g.beginFill(UIConfig.COLOR_LINE);
            g.drawRect(0, 0, cols * UIConfig.GRID_SIZE, rows * UIConfig.GRID_SIZE);
            g.endFill();
            
            g.lineStyle(UIConfig.LINE_WEIGHT, UIConfig.COLOR_LINE, 1, true);
            
            for (var i:int = 0; i < rows; i++)
            {
                for (var j:int = 0; j < cols; j++)
                {
                    g.beginFill((i + j) % 2 == 1 ? UIConfig.COLOR_1 : UIConfig.COLOR_2);
                    g.drawRoundRect(j * UIConfig.GRID_SIZE, i * UIConfig.GRID_SIZE, UIConfig.GRID_SIZE, UIConfig.GRID_SIZE, UIConfig.ELLIPSE);
                    g.endFill();
                }
            }
        }
    
    }

}