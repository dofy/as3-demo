package ui
{
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class MyText extends TextField
    {
        
        public function MyText(str:String, color:uint = 0)
        {
            this.selectable = false;
            
            var tf:TextFormat = new TextFormat('consolas', 14, color);
            tf.align = TextFormatAlign.LEFT;
            
            this.defaultTextFormat = tf;
            this.autoSize = TextFieldAutoSize.LEFT;
            
            this.text = str;
        }
    
    }

}