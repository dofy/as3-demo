package
{
    import flash.display.NativeMenu;
    import flash.display.NativeMenuItem;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;
    import nicegame.components.Map;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Main extends Sprite
    {
        private var menuFile:NativeMenuItem;
        private var menuEdit:NativeMenuItem;
        private var menuHelp:NativeMenuItem;
        
        private var editItem:int = 0;
        private var map:Map;
        
        public function Main():void
        {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP_LEFT;
            
            stage.addEventListener(Event.RESIZE, onResize);
            
            initMenu();
            initUI();
        }
        
        private function onResize(e:Event):void
        {
            map.x = stage.stageWidth - map.mapWidth >> 1;
            map.y = stage.stageHeight - map.mapHeight >> 1;
        }
        
        private function initMenu():void
        {
            menuFile = new NativeMenuItem('文件(&F)');
            menuEdit = new NativeMenuItem('编辑(&E)');
            menuHelp = new NativeMenuItem('帮助(&H)');
            
            stage.nativeWindow.menu = new NativeMenu();
            stage.nativeWindow.menu.addItem(menuFile);
            stage.nativeWindow.menu.addItem(menuEdit);
            stage.nativeWindow.menu.addItem(menuHelp);
            
            // menu file
            menuFile.submenu = createFileMenu();
            menuEdit.submenu = createEditMenu();
            menuHelp.submenu = createHelpMenu();
        }
        
        private function createFileMenu():NativeMenu
        {
            var result:NativeMenu = new NativeMenu();
            var item:NativeMenuItem;
            item = result.addItem(new NativeMenuItem('打开(&O)'));
            //item.keyEquivalentModifiers = 
            result.addItem(new NativeMenuItem('保存(&S)'));
            result.addItem(new NativeMenuItem('-', true));
            result.addItem(new NativeMenuItem('退出(&E)'));
            result.addEventListener(Event.SELECT, menuSelectHandler);
            return result;
        }
        
        private function createEditMenu():NativeMenu
        {
            var result:NativeMenu = new NativeMenu();
            result.addItem(new NativeMenuItem('通行(&0)')).checked = true;
            result.addItem(new NativeMenuItem('阻挡(&1)'));
            result.addItem(new NativeMenuItem('透明(&2)'));
            result.addEventListener(Event.SELECT, menuSelectHandler);
            return result;
        }
        
        private function createHelpMenu():NativeMenu
        {
            var result:NativeMenu = new NativeMenu();
            result.addItem(new NativeMenuItem('帮助(&C)'));
            result.addItem(new NativeMenuItem('-', true));
            result.addItem(new NativeMenuItem('关于(&A)'));
            result.addEventListener(Event.SELECT, menuSelectHandler);
            return result;
        }
        
        private function menuSelectHandler(e:Event):void
        {
            switch (e.target.label)
            {
                case '通行(&0)': 
                    menuEdit.submenu.getItemAt(editItem).checked = false;
                    menuEdit.submenu.getItemAt(0).checked = true;
                    editItem = 0;
                    break;
                case '阻挡(&1)': 
                    menuEdit.submenu.getItemAt(editItem).checked = false;
                    menuEdit.submenu.getItemAt(1).checked = true;
                    editItem = 1;
                    break;
                case '透明(&2)': 
                    menuEdit.submenu.getItemAt(editItem).checked = false;
                    menuEdit.submenu.getItemAt(2).checked = true;
                    editItem = 2;
                    break;
                default: 
                    // nothing...
                    break;
            }
        }
        
        private function initUI():void
        {
            map = new Map(600, 450);
            addChild(map);
            onResize(null);
            
			return;
            trace(Math.ceil(2.3));
            trace(Math.ceil(-2.8));
            trace(Math.round(-2.6));
            
            var chars:Array = ['零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖', '拾'];
            var date:Date = new Date();
            var years:Array = date.getFullYear().toString().split('');
            var month2:int = (date.getMonth() + 1) % 10;
            var month1:int = date.getMonth() + 1 - month2;
            var date2:int = date.getDate() % 10;
            var date1:int = date.getDate() - date2;
            trace(chars[years[0]] + chars[years[1]] + chars[years[2]] + chars[years[3]] + '年' + chars[month1] + chars[month2] + '月' + chars[date1] + chars[date2] + '日');
            
            var arr:Array = [1, 2, 3, 4];
            var sum:int = 0;
            for (var i:String in arr)
            {
                sum += arr[i];
            }
            trace(sum);
            
            var arr2:Array = [1, 2, 3, 4, 5];
            arr2.pop();
            trace(arr2);
            
            var a:Array = [3, 4, 6, 7, 9];
            a.push(5);
            a.shift();
            trace(a.length);
            a[4] += 5;
            trace(a);
            
            var b:Array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
            for (var j:int = 0; j < b.length; j++)
            {
                for (var k:int = 0; k < b[j].length; k++)
                {
                    trace(b[j][k]);
                }
            }
        }
    
    }

}