package
{
    
    import fl.controls.Button;
    import flash.desktop.Clipboard;
    import flash.desktop.ClipboardFormats;
    import flash.display.MovieClip;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    
    public class MapEditor extends MovieClip
    {
        
        private var btn:Button;
        private var bar:ToolBar;
        private var map:Map;
        
        private var selectedTool:Place;
        
        public function MapEditor()
        {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;
            
            initUI();
            
            // test
            test();
        }
        
        private function initUI():void 
        {
            btn = new Button();
            btn.label = 'Create';
            btn.x = btn.y = 10;
            addChild(btn);
            btn.addEventListener(MouseEvent.CLICK, createHandler);
            
            bar = new ToolBar();
            bar.x = 10;
            bar.y = 50;
            addChild(bar);
            
            map = new Map(30, 20);
            map.x = 150;
            map.y = 10;
            addChild(map);
        }
        
        private function createHandler(e:MouseEvent):void 
        {
            test();
        }
        
        private function test():void 
        {
            Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, map.mapData);
            trace(map.mapData);
        }
    }

}
