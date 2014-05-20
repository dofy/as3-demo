/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class MainPageUI extends View {
		public var txtUid:Label;
		public var input:TextInput;
		public var send:Button;
		public var output:TextArea;
		public var nickName:TextInput;
		public var users:ComboBox;
		protected var uiXML:XML =
			<View>
			  <Label text="UID: " x="10" y="5" var="txtUid" font="consolas" size="14"/>
			  <TextInput skin="png.comp.textinput" x="360" y="5" width="340" height="24" var="input" sizeGrid="5,5,5,5" font="consolas" size="14"/>
			  <Button label="Send" skin="png.comp.button" x="710" y="5" labelFont="consolas" var="send" labelSize="14"/>
			  <TextArea skin="png.comp.textarea" x="10" y="35" width="780" var="output" sizeGrid="5,5,3,3" height="550" editable="false" font="consolas" size="14" scrollBarSkin="png.comp.vscroll" isHtml="true" multiline="true"/>
			  <TextInput skin="png.comp.textinput" x="100" y="5" width="100" height="24" var="nickName" font="consolas" size="14" editable="false" sizeGrid="5,5,5,5"/>
			  <Label text="说：" x="330" y="7"/>
			  <ComboBox labels="全部" skin="png.comp.combobox" x="230" y="5" height="24" var="users" itemSize="14" scrollBarSkin="png.comp.vscroll" selectedIndex="0" labelSize="14"/>
			  <Label text="对" x="205" y="7"/>
			</View>;
		public function MainPageUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}