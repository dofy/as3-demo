package
{
    import flash.desktop.Clipboard;
    import flash.desktop.ClipboardFormats;
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.MouseEvent;
    import ui.Group;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        
        private var LENG:int = 4;
        
        private var PADDING:int = 30;
        
        private var groups:Vector.<Group>;
        
        private var allData:Array;
        
        public function Main():void
        {
            initUI();
            bindEvents();
        }
        
        private function initUI():void
        {
            groups = new Vector.<Group>;
            for (var i:int = 0, group:Group; i < LENG; i++)
            {
                group = new Group();
                group.x = i * (Group.SIZE * Group.GRID_SIZE + PADDING) + PADDING;
                group.y = PADDING;
                addChild(group);
                groups.push(group);
            }
        }
        
        private function bindEvents():void
        {
            stage.doubleClickEnabled = true;
            
            stage.addEventListener(MouseEvent.CLICK, clickHandler);
            stage.addEventListener(MouseEvent.DOUBLE_CLICK, dbClickHandler);
        }
        
        private function dbClickHandler(e:MouseEvent):void 
        {
            for (var i:int = 0; i < LENG; i++) 
            {
                groups[i].reset();
            }
        }
        
        private function clickHandler(e:MouseEvent):void
        {
            if (e.target is Stage)
            {
                allData = [];
                for (var i:int = 0; i < LENG; i++)
                {
                    groups[i].hasData && allData.push(groups[i].data);
                }
                
                Clipboard.generalClipboard.setData(ClipboardFormats.TEXT_FORMAT, JSON.stringify(allData));
            }
        }
    
    }

}