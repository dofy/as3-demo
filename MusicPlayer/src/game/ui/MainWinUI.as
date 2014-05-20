/**Created by Morn,Do not modify.*/
package game.ui {
	import morn.core.components.*;
	public class MainWinUI extends View {
		public var btnPrev:Button;
		public var btnPlay:Button;
		public var btnNext:Button;
		public var lblTitle:Label;
		public var lblTime:Label;
		public var sldVol:VSlider;
		public var progressBar:ProgressBar;
		public var fileList:List;
		public var btnAdd:Button;
		public var btnDel:Button;
		protected var uiXML:XML =
			<View>
			  <Box x="15" y="15">
			    <Box y="60">
			      <Button label="&lt;&lt;" skin="png.comp.button" width="30" var="btnPrev" labelFont="consolas"/>
			      <Button label=">" skin="png.comp.button" x="30" width="50" var="btnPlay" labelFont="consolas"/>
			      <Button label=">>" skin="png.comp.button" x="80" width="30" var="btnNext" labelFont="consolas"/>
			    </Box>
			    <Label text="title" x="0" y="5" var="lblTitle" font="微软雅黑" size="30" width="350" height="50" color="0x33"/>
			    <Label text="time" x="275" y="62" var="lblTime" font="consolas" color="0x666666"/>
			    <VSlider skin="png.comp.vslider" x="365" y="0" height="80" min="-1" max="0" showLabel="false" sizeGrid="0,2,2,0" tick="0.1" var="sldVol" value="-1"/>
			    <ProgressBar skin="png.custom.progress" x="120" y="65" sizeGrid="5,3,5,3" width="150" var="progressBar"/>
			  </Box>
			  <List x="15" y="120" repeatX="1" var="fileList" spaceY="2" repeatY="10">
			    <VScrollBar skin="png.comp.vscroll" x="350" y="0" name="scrollBar" height="240"/>
			    <Box name="render">
			      <Clip url="png.custom.clip_selectBox" x="0" y="0" height="22" width="350" name="selectBox" clipHeight="24"/>
			      <Label text="label" x="32" y="2" name="mpName" width="310" font="consolas"/>
			      <Label text="label" x="0" y="2" name="mpIndex" width="30" color="0x333333" font="consolas" align="right"/>
			    </Box>
			  </List>
			  <Box x="15" y="370">
			    <Button label="ADD" skin="png.comp.button" var="btnAdd" labelFont="consolas"/>
			    <Button label="DEL" skin="png.comp.button" x="85" var="btnDel" labelFont="consolas"/>
			  </Box>
			</View>;
		override protected function createChildren():void {
			createView(uiXML);
		}
	}
}