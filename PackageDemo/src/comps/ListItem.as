package comps 
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class ListItem extends Sprite 
    {
        
        private var _data:Object;
        private var txtName:TextField;
        private var txtNum:TextField;
        
        public function ListItem() 
        {
            super();
			
            mouseChildren = false;
            
            initUI();
        }
        
        private function initUI():void 
        {
            graphics.beginFill(0x008000, 0.3);
            graphics.drawRect(0, 0, 120, 70);
            graphics.endFill();
            
            txtName = new TextField();
            txtName.autoSize = TextFieldAutoSize.LEFT;
            addChild(txtName);
            
            txtNum = new TextField();
            txtNum.autoSize = TextFieldAutoSize.LEFT;
            addChild(txtNum).y = 50;
        }
        
        public function get data():Object 
        {
            return _data;
        }
        
        public function set data(value:Object):void 
        {
            _data = value;
            
            txtName.text = data.data.name;
            txtNum.text = data.num;
        }
        
    }

}