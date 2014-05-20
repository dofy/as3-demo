/**Created by Morn,Do not modify.*/
package game.ui.dialogs {
	import morn.core.components.*;
	public class DialogTool1UI extends Dialog {
		public var toolList:List;
		protected var uiXML:XML =
			<Dialog dragArea="0,0,400,30">
			  <Image url="png.comp.bg" x="0" y="3" width="400" height="400" sizeGrid="4,26,4,4"/>
			  <Button skin="png.comp.btn_close" x="361" y="3" name="close"/>
			  <List x="20" y="40" repeatX="5" repeatY="5" spaceX="15" spaceY="10" var="toolList">
			    <Box name="render" x="0" y="0">
			      <Image url="png.other.streng" width="60" height="60" name="icon"/>
			    </Box>
			  </List>
			</Dialog>;
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}