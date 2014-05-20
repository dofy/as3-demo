/**Created by the Morn,do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class DatePageUI extends View {
		public var cYear:ComboBox;
		public var cMonth:ComboBox;
		public var cDay:ComboBox;
		protected var uiXML:XML =
			<View>
			  <ComboBox labels="label1,label2" skin="png.comp.combobox" x="87" y="92" sizeGrid="3,3,20,3" var="cYear"/>
			  <ComboBox labels="label1,label2" skin="png.comp.combobox" x="194" y="92" width="60" sizeGrid="3,3,20,3" var="cMonth"/>
			  <ComboBox labels="label1,label2" skin="png.comp.combobox" x="270" y="92" sizeGrid="3,3,20,3" width="60" var="cDay"/>
			</View>;
		public function DatePageUI(){}
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}