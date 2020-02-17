package
{
	
	import fl.controls.ColorPicker;
	import fl.events.ColorPickerEvent;
	import fl.motion.Color;
	
	import flash.display.Graphics;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flashx.textLayout.events.UpdateCompleteEvent;

	public class ForGraphics extends MovieClip
	{
		private var cp:ColorPicker = new ColorPicker;
		public function ForGraphics()
		{
			this.graphics.lineStyle(2, 0x00fa00);
			/*this.graphics.beginFill(0xff0500);
			this.graphics.lineTo(100, 100);
			this.graphics.lineTo(100, 0);
			this.graphics.lineTo(0, 0);*/
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMD);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMU);
			
			addChild(cp);
			cp.addEventListener(ColorPickerEvent.CHANGE, onCPCHange);
//			this.graphics.drawCircle(50, 50, 50);
		}
		private function onCPCHange(e:ColorPickerEvent):void
		{
			this.graphics.lineStyle(3, cp.selectedColor);
		}
		protected function onMU(event:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMM);			
		}
		
		protected function onMD(event:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMM);
			this.graphics.moveTo(mouseX, mouseY);
			
		}
		
		protected function onMM(event:MouseEvent):void
		{
			this.graphics.lineTo(mouseX, mouseY);			
		}
	}
}