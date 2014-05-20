/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class MainPageUI extends View {
		public var txtLog:TextArea;
		public var userList:List;
		public var txtPort:TextInput;
		public var btnListen:Button;
		protected var uiXML:XML =
			<View>
			  <TextArea skin="png.comp.textarea" width="545" height="390" x="150" y="5" scrollBarSkin="png.comp.vscroll" font="consolas" var="txtLog" sizeGrid="10,10,3,3" editable="false" size="14"/>
			  <List x="5" y="35" var="userList" spaceY="4" repeatX="1" repeatY="15">
			    <Box name="render" x="0" y="0">
			      <Label text="999" font="consolas" width="30" size="14" height="20" name="uid" x="0" align="right"/>
			      <Label text="name" font="consolas" width="80" size="14" height="20" name="name" x="32" y="0"/>
			    </Box>
			    <VScrollBar skin="png.comp.vscroll" x="115" y="0" name="scrollBar" width="17" height="360"/>
			  </List>
			  <TextInput text="7777" skin="png.comp.textinput" x="5" y="5" width="60" height="22" restrict="0-9" maxChars="5" font="consolas" size="14" var="txtPort"/>
			  <Button label="Listen" skin="png.comp.button" x="70" y="5" var="btnListen" width="70" height="23" labelFont="consolas"/>
			</View>;
		public function MainPageUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}