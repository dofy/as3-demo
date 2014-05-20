/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class LoginUI extends Dialog {
		public var nickName:TextInput;
		public var btnLogin:Button;
		protected var uiXML:XML =
			<Dialog>
			  <Image url="png.comp.bg" x="0" y="0" width="300" height="100" sizeGrid="7,30,7,7"/>
			  <TextInput skin="png.comp.textinput" x="20" y="45" height="30" font="consolas" size="20" width="170" var="nickName" sizeGrid="5,5,5,5"/>
			  <Label text="设置姓名" x="10" y="4" bold="true"/>
			  <Button label="Login" skin="png.comp.button" x="205" y="45" height="30" labelSize="15" labelFont="consolas" var="btnLogin"/>
			</Dialog>;
		public function LoginUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}