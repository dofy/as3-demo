package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import nicegame.ui.MyButton;
	import nicegame.ui.Test;
	
	/**
	 * MyButton Demo
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
		
        private var button1:MyButton;
        private var button2:MyButton;
        private var button3:MyButton;
        private var button4:MyButton;
        
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
        /**
         * 初始化
         * @param e
         */
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
            
            button1 = new MyButton('Test Button1', 100, 40);
            addChild(button1).y = 10;
            
            // 按钮2, 用于禁用按钮1
            button2 = new MyButton('kill button1', 180, 50, 0xff0000, 0x00ff00, 0x0000ff);
            addChild(button2).y = 100;
            button2.addEventListener(MouseEvent.CLICK, onClick2);
            
            // 按钮3, 用于改变按钮1样式
            button3 = new MyButton('change button1', 180, 50);
            addChild(button3).y = 160;
            button3.addEventListener(MouseEvent.CLICK, onClick3);
            
            // 按钮4, 测试按钮1
            button4 = new MyButton('check button1', 180, 50);
            addChild(button4).y = 220;
            button4.addEventListener(MouseEvent.CLICK, onClick4);
            
            button1.x = button2.x = button3.x = button4.x = 10;
            
            // 测试代码
            setTimeout(function():void { button1.width = 200; button1.height = 80; }, 1000);
			
			var t:Test = new Test();
		}
        
        private function onClick2(e:MouseEvent):void 
        {
            button1.enable = !button1.enable;
            //button1.visible = false;
            //removeChild(button1);
            //button1 = null;
        }
        
        private function onClick3(e:MouseEvent):void 
        {
            button1.label = 'hello';
            button1.font  = 'courier new';
            button1.color = 0x345678;
            button1.size  = 50;
        }
        
        private function onClick4(e:MouseEvent):void 
        {
            button1.check();
        }
		
	}
	
}