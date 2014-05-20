/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class MainPageUI extends View {
		public var btnOpen:Button;
		public var lblFilename:Label;
		protected var uiXML:XML =
			<View>
			  <Button label="Open" skin="png.comp.button" x="10" y="9" var="btnOpen"/>
			  <Label text="LastFileName" x="94" y="10" autoSize="left" var="lblFilename"/>
			</View>;
		public function MainPageUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}