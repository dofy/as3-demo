package
{
    import fl.controls.List;
    import fl.controls.TextArea;
    import fl.controls.TextInput;
    import fl.data.DataProvider;
    import flash.display.Sprite;
    import flash.events.KeyboardEvent;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var input:TextInput;
        private var area:TextArea;
        private var list:List;
        
        public function Main():void
        {
            init();
        }
        
        private function init():void
        {
            Dict.load('dict.txt', loadComplete);
            
            input = new TextInput();
            addChild(input).width = 200;
            
            list = new List();
            addChild(list);
            list.y = 30;
            list.width = 200;
            list.height = 300;
            
            area = new TextArea();
            addChild(area);
            area.x = 210;
            area.y = 30;
            area.width = 200;
            area.height = 300;
        }
        
        private function onKeyUp(e:KeyboardEvent):void
        {
            list.dataProvider = getData(input.text);
            area.text = getText(input.text);
        }
        
        private function getText(text:String):String
        {
            var result:String = '';
            var arr:Array = Dict.dict[text] || [];
            for (var i:int = 0, l:int = arr.length; i < l; i++)
            {
                result += (i + 1) + '.\t' + arr[i] + '\n';
            }
            return result;
        }
        
        private function getData(text:String):DataProvider
        {
            return new DataProvider(Dict.dict[text] || []);
        }
        
        private function loadComplete():void
        {
            trace('load complete');
            input.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
        }
    
    }

}