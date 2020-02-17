package
{

	
	
	
	import fl.controls.ColorPicker;
	import fl.events.ColorPickerEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.utils.ByteArray;
	
	public class paint extends MovieClip
	{
		private const WIDTH:uint = 150;
		private var cp:ColorPicker = new ColorPicker();
		private var sost:Boolean = true;
		public function paint()
		{
			//рисуем квадрат, в котором будем рисовать мышью и cp для выбора цветов
			this.graphics.lineStyle(2,cp.selectedColor);
			this.graphics.drawRect(0, 0, WIDTH, WIDTH);			
			cp.x = WIDTH;
			addChild(cp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMD);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMU);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMDCl);
			cp.addEventListener(ColorPickerEvent.CHANGE, onCPChange);
		}
		
		protected function onMDCl(event:MouseEvent):void
		{
			// очистка квадрата и сцены
			var col:uint = cp.selectedColor;
			while(this.numChildren){
				this.removeChildAt(0);
			}
			addChild(cp);
			cp.selectedColor = col;
			this.graphics.clear();
			this.graphics.lineStyle(2,cp.selectedColor);
			this.graphics.drawRect(0, 0, WIDTH, WIDTH);
			
			
		}
		
		protected function onCPChange(event:ColorPickerEvent):void
		{
			// меняем цвет линии
			this.graphics.lineStyle(2, cp.selectedColor);
		}
		
		protected function onMD(event:MouseEvent):void
		{
			// начальную точку к указателю мыши, но только в квадрате
			if (mouseX<=WIDTH && mouseY<=WIDTH) 
			{
//				trace(mouseX);
				stage.addEventListener(MouseEvent.MOUSE_MOVE, onMM);
				this.graphics.moveTo(mouseX, mouseY);
			}
			
		}
		
		protected function onMM(event:MouseEvent):void
		{
			// рисуем
			if (mouseX<=WIDTH && mouseY<=WIDTH) 
			{
				this.graphics.lineTo(mouseX, mouseY);
			}
			var raw:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight); 
			raw.draw(stage);
			
			if (sost) 
			{
				for (var i:int = 1; i < WIDTH-1; i+=2) 
				{
					for (var j:int = 1; j < WIDTH-1; j+=2) 
					{
						if (raw.getPixel(j,i)<0xffffff)
						{
							if (raw.getPixel(j+WIDTH,i+WIDTH) == 0xffffff){
								var my_ball:FlyingBall = new FlyingBall(cp.selectedColor);
								my_ball.x = j+WIDTH;
								my_ball.y = i+WIDTH;
								addChild(my_ball);
							}
							
						}
					}
					
				}	
			}else{
				var col:uint = cp.selectedColor;
				while(this.numChildren){
					this.removeChildAt(0);
				}
				addChild(cp);
				cp.selectedColor = col;
				sost=true;
			}			
		}
		
		protected function onMU(event:MouseEvent):void
		{
			// прекращаем рисование, т.е. отменяем событие
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMM);
			sost = false;			
		}
	}
}