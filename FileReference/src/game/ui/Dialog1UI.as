/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class Dialog1UI extends Dialog {
		public var list:List;
		protected var uiXML:XML =
			<Dialog>
			  <Image url="png.comp.bg" x="0" y="0" width="500" height="350" sizeGrid="6,30,6,6"/>
			  <Button skin="png.comp.btn_close" x="458" y="1" name="close"/>
			  <Image url="png.comp.blank" x="6" y="2" width="447" height="22" name="drag"/>
			  <List x="14" y="63" repeatY="3" spaceY="5" var="list" name="list2" repeatX="3" spaceX="5">
			    <Box name="render">
			      <Image url="png.comp.bg" width="152" height="79"/>
			      <Button label="Buy" skin="png.comp.button" x="69" name="btn" y="3"/>
			      <CheckBox label="label" skin="png.comp.checkbox" y="32" name="combo" x="80"/>
			      <Image url="png.other.battle" x="22" y="6" width="40" height="39"/>
			      <Label text="label" x="110" y="51" name="num"/>
			      <ComboBox labels="1,2,3,4,5,6" skin="png.comp.combobox" y="51" x="4"/>
			    </Box>
			    <VScrollBar skin="png.comp.vscroll" x="467" width="17" height="198" name="scrollBar" y="9"/>
			  </List>
			</Dialog>;
		public function Dialog1UI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}