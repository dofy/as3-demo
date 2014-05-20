package bwie.game 
{
    import bwie.game.dialogs.DialogTool1;
    import flash.events.MouseEvent;
	import game.ui.SceneUI;
	
	/**
     * ...
     * @author Seven Yu
     */
    public class Scene extends SceneUI 
    {
        
        public function Scene() 
        {
            tool1.addEventListener(MouseEvent.CLICK, clickHandler);
        }
        
        private function clickHandler(e:MouseEvent):void 
        {
            App.dialog.popup(new DialogTool1());
        }
        
    }

}