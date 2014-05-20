package  
{
    import flash.events.Event;
    
    /**
     * 菜单树事件
     */
    public class TreeEvent extends Event 
    {
        public static const NODE_CLICK:String = 'node_click';
        
        public var title:String;
        public var url:String;
        
        public function TreeEvent(type:String, title:String, url:String, bubbles:Boolean=false, cancelable:Boolean=false) 
        { 
            super(type, bubbles, cancelable);
            
            this.title = title;
            this.url = url;
        } 
        
        public override function clone():Event 
        { 
            return new TreeEvent(type, title, url, bubbles, cancelable);
        } 
        
        public override function toString():String 
        { 
            return formatToString("TreeEvent", "type", "title", "url", "bubbles", "cancelable", "eventPhase"); 
        }
        
    }
    
}