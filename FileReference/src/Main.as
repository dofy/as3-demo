package 
{
    import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
    import flash.net.FileReference;
    import flash.text.TextField;
    import flash.utils.ByteArray;
    import utils.SOTool;
	
	/**
	 * ...
	 * @author Seven Yu
	 */
	public class Main extends Sprite 
	{
        private var fr:FileReference;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
            
            //trace(SOTool.instance.read('aa', 'test'));
            SOTool.instance['write']('aa', 'xxx');
            SOTool.instance.write('bb', 'xxx');
            
            SOTool.instance.write('cc', 'xxx');
            SOTool.instance.write('dd', 'xxx');
            trace(SOTool.instance.read('aa', 'test'));
            
            //trace('a' && "b" && false && null);
            
            trace(0 || null || 'abc');
            
            fr = new FileReference();
            fr.browse();
            
            fr.addEventListener(Event.SELECT, onSelect);
            fr.addEventListener(Event.OPEN, onOpen);
            fr.addEventListener(Event.COMPLETE, onComplete);
		}
        
        private function onComplete(e:Event):void 
        {
            var tf:TextField = new TextField();
            addChild(tf);
            
            var loader:Loader = new Loader();
            loader.loadBytes(fr.data);
            
            addChild(loader);
            
            //tf.text = fr.data.readUTFBytes(fr.data.length);
            //trace(fr.data);
        }
        
        private function onOpen(e:Event):void 
        {
            trace('open');
        }
        
        private function onSelect(e:Event):void 
        {
            trace('select');
            fr.load();
        }
		
	}
	
}