package view
{
    import game.ui.Dialog1UI;
    import morn.core.components.Button;
    import morn.core.components.CheckBox;
    import morn.core.components.ComboBox;
    import morn.core.components.Component;
    import morn.core.components.List;
    import morn.core.handlers.Handler;
    
    /**
     * ...
     * @author Seven Yu
     */
    public class Dialog1 extends Dialog1UI
    {
        private var list1:List;
        
        public function Dialog1()
        {
            super();
            
            //list.
            
            list1 = getChildByName('list2') as List;
            
            list1.renderHandler = new Handler(renderHandler);
            
            //list1.array = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1];
            list1.dataSource = [{num:3,combo: 111,selected:true, btn: 2221},{combo: 1112,selected:true, btn: 2224},{combo: 1113,selected:false, btn: '2rr22'},{combo: 111666,selected:true, btn: '222asdf'}];
        
        }
        
        private function renderHandler(item:Component, index:int):void 
        {
            if (index < list1.length)
            {
                var data:Object = item.dataSource;
                
                var combo:CheckBox = item.getChildByName('combo') as CheckBox;
                var btn:Button = item.getChildByName('btn') as Button;
                
                btn.label = data.btn;
                
                combo.label = data.combo;
                combo.selected = data.selected;
            }
        }
    
    }

}