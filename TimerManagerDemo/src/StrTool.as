package
{
    
    /**
     * ...
     * @author Seven Yu
     */
    public class StrTool
    {
        
        public function StrTool()
        {
        
        }
        
        public static function format(str:String):String
        {
            var regInt:RegExp = /int_(\d+)(_)int/g;
            
            return str.replace(regInt, intFunc);
        }
        
        static private function intFunc(oStr:String, parts:String, ... others):String
        {
            return 'int(' + parts + ')';
        }
    
    }

}