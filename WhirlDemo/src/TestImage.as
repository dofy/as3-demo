package
{
    import flash.display.Graphics;
    import flash.display.Shape;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class TestImage extends Shape
    {
        
        public function TestImage()
        {
            var g:Graphics = this.graphics;
            
            // 绘制方块
            g.beginFill(0xffcc00, 0.7);
            g.drawRect(0, 0, 200, 200);
            g.endFill();
            
            // ===== 忽略代码 =====
            if (Config.showTip)
            {
                // 绘制注册点
                g.lineStyle(1, 0x008000, 0.3);
                g.moveTo(-20, 0);
                g.lineTo(20, 0);
                g.moveTo(0, -20);
                g.lineTo(0, 20);
            }
            // ===== 忽略代码 =====
        }
    
    }

}