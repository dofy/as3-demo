package
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var box:ImageBox;
        
        public function Main():void
        {
            // 注释掉下面这行可以开启辅助线
            //Config.showTip = false;
            
            // 是否旋转
            //Config.whirl = false;
            
            // 始终旋转
            //Config.always = true;
            
            box = new ImageBox(this.graphics);
            box.x = 300;
            box.y = 200;
            addChild(box);
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            return;
            trace(sumOdd(2, 5));
            
            trace(checkRole('aa, bb,cc ,dd ','abb, aa , cc4'));
            
            var a:TestImage = new TestImage();
            a.width = 500;
            a.height = 300;
            addChild(a);
            var b:TestImage = new TestImage();
            b.width = 300;
            b.height = 200;
            addChild(b);
            alignCenter(b, a);
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        // ==========================================
        public function sumOdd(min:int, max:int):int
        {
            if (min % 2 != 1)
            {
                min++;
            }
            
            var result:int = 0;
            for (var i:int = min; i <= max; i += 2)
            {
                result += i;
            }
            
            return result;
        }
        
        public function alignCenter(obj2:DisplayObject, obj1:DisplayObject):void
        {
            obj2.x = obj1.x + (obj1.width - obj2.width) / 2;
            obj2.y = obj1.y + (obj1.height - obj2.height) / 2;
        }
        
        public function checkRole(allowedRoles:String, currentRoles:String):Boolean
        {
            // 以逗号分隔(前后可能包含空格)
            // 正则表达式 \s代表空白符 *代表0到多个
            // 先用 trim 去掉整个字符串的前后空格
            var aRoles:Array = trim(allowedRoles).split(/\s*,\s*/);
            var cRoles:Array = trim(currentRoles).split(/\s*,\s*/);
            
            // 循环检测
            for (var i:int = 0; i < cRoles.length; i++) 
            {
                if (aRoles.indexOf(cRoles[i]) !== -1)
                {
                    return true;
                }
            }
            return false;
            
            // 去掉字符串前后空格
            function trim(str:String):String
            {
                // 正则表达式含义 
                // ^  : 匹配开头
                // \s : 空白符
                // +  : 1到多个
                // |  : 或
                // $  : 匹配结尾
                return str.replace(/^\s+|\s+$/g, '');
            }
        }
    
    }

}