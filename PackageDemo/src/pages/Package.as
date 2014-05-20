package pages 
{
    import comm.Global;
    import comps.List;
    import comps.Pager;
	import flash.display.Sprite;
    import flash.events.Event;
    import utils.JsonLoader;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Package extends Sprite 
    {
        private var list:List;
        private var pager:Pager;
        
        public function Package() 
        {
            super();
			
            initUI();
            loadUserData();
        }
        
        private function initUI():void 
        {
            list = new List();
            addChild(list);
            list.addEventListener(Event.SELECT, onSelect);
            
            pager = new Pager();
            pager.pageCount = 2;
            addChild(pager);
            pager.y = 240;
            pager.addEventListener(Event.SELECT, onPage);
        }
        
        private function onPage(e:Event):void 
        {
            Global.uid = pager.currentPage.toString();
            loadUserData();
        }
        
        private function loadUserData():void 
        {
            var jl:JsonLoader = new JsonLoader();
            jl.addEventListener(Event.COMPLETE, onCompelte);
            jl.load('mydata/user_' + Global.uid + '.json');
        }
        
        private function onCompelte(e:Event):void 
        {
            list.data = e.target.data;
        }
        
        private function onSelect(e:Event):void 
        {
            var list:List = e.target as List;
            trace(JSON.stringify(list.selectedItem.data));
        }
        
    }

}