package
{
    import flash.display.Sprite;
    import flash.filesystem.File;
    import flash.net.FileReference;
    import flash.net.URLRequest;
    import flash.text.TextField;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        public function Main():void
        {
            
            // 创建 work 文件夹
            File.documentsDirectory.resolvePath('work').createDirectory();
            
            // 打印文件名
            var file:File = new File('D:/work/des/main.as');
            trace(file.name);
            
            // 保存图片
            var imgFile:FileReference = new FileReference();
            //imgFile.download(new URLRequest('http://ww4.sinaimg.cn/bmiddle/e1a6c695tw1eemfjm18ydj20b40go75z.jpg'));
            
            var txt:TextField = new TextField();
            addChild(txt);
            txt.htmlText = '<font color="#ff0000" face="consolas" size="16">test text</font>';
        }
    
    }

}