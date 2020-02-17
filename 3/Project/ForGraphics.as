package
{
	import fl.controls.ColorPicker;
	import fl.events.ColorPickerEvent;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.events.UpdateCompleteEvent;
	
	public class ForGraphics extends MovieClip
	{
		private var cp:ColorPicker = new ColorPicker();
		public function ForGraphics()
		{
			this.graphics.lineStyle(2,0x00ff00);
			/*this.graphics.beginFill(0xff0000);
			this.graphics.lineTo(100,100);
			this.graphics.lineTo(100,0);
			this.graphics.lineTo(0,0);*/
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMD);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMU);
			
			addChild(cp);
			cp.addEventListener(ColorPickerEvent.CHANGE, onCPCHange);
			this.graphics.drawCircle(50,50,50);
		}
		private function onCPCHange(e:ColorPickerEvent):void{
			this.graphics.lineStyle(2, cp.selectedColor);
		}
		private function onMD (e:MouseEvent):void{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMM);
			this.graphics.moveTo(mouseX, mouseY);
		}
		private function onMU (e:MouseEvent):void{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMM);
		}
		private function onMM (e:MouseEvent){
			this.graphics.lineTo(mouseX, mouseY);
		}
	}
}




