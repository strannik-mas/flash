package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import fl.motion.MotionEvent;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import flashx.textLayout.formats.Float;
	
	public class ForShow extends MovieClip
	{
		private const NAME_LOADER:String = "loader_1";
		private const SPEED:uint = 5;
		private var bl:BulkLoader = new BulkLoader(NAME_LOADER);
		private var width_pic:int;
		private var height_pic:int;
		public function ForShow()
		{
			for (var i:int = 1; i <= 3; i++) 
			{
				bl.add("images/img" + i + ".jpg");
			}
			bl.addEventListener(BulkProgressEvent.COMPLETE, onBLCOMP);
			bl.start();
		}
		
		protected function onBLCOMP(e:BulkProgressEvent):void
		{
/*			var bm1:Bitmap = bl.getBitmap('images/img1.jpg');
			var bm2:Bitmap = bl.getBitmap('images/img2.jpg');
			var bm3:Bitmap = bl.getBitmap('images/img3.jpg');
			width_pic = bm1.width;
			height_pic = bm1.height;
			
			//масштабирование
			bm1.scaleX= bm2.scaleX= bm3.scaleX= bm1.scaleY= bm2.scaleY=bm3.scaleY=.25;
			
			var as_mc1:Sprite = new Sprite();
			var as_mc2:Sprite = new Sprite();
			var as_mc3:Sprite = new Sprite();
			as_mc1.graphics.drawRect(bm1.x, bm1.y, bm1.width, bm1.height);
			as_mc2.graphics.drawRect(bm2.x, bm2.y, bm2.width, bm2.height);
			as_mc3.graphics.drawRect(bm3.x, bm3.y, bm3.width, bm3.height);
			
			addChild(as_mc1);
			addChild(as_mc2);
			addChild(as_mc3);
			as_mc1.addChild(bm1);
			as_mc2.addChild(bm2);
			as_mc2.x 
			as_mc1.addEventListener(MouseEvent.MOUSE_DOWN, onMD);*/
			
			var pic:Vector.<Bitmap> = new Vector.<Bitmap>();
//			var as_mc:Vector.<Sprite> = new Vector.<Sprite>();
			for (var i:int = 1; i <= 3; i++){
				pic[i-1] = bl.getBitmap("images/img" + i + ".jpg");
				
				//сохраняем исходные размеры
				width_pic = pic[i-1].width;
				height_pic = pic[i-1].height;
				
				//создаем объект -оболочку, т.к. нельзя слушать события мыши картинкой
				var as_mc:MovieClip = new MovieClip();
//				as_mc.graphics.drawRect(pic[i-1].x, pic[i-1].y, pic[i-1].width, pic[i-1].height);
				addChild(as_mc);
				
				//масштабирование
				pic[i-1].scaleX= .25;
				pic[i-1].scaleY = .25;
				
				//раскладка по сцене
//				pic[i-1].x = (stage.stageWidth/3 -2)*(i-1)+5; 
				as_mc.addChild(pic[i-1]);
				as_mc.x = (stage.stageWidth/3 -2)*(i-1)+5; 
				as_mc.addEventListener(MouseEvent.MOUSE_DOWN, onMD);
			}
			
			
		}
		
		protected function onMD(e:MouseEvent):void
		{
			//сдвиг и увеличение
			var dx:Number = (stage.stageWidth/2 - e.target.x)/SPEED;
			var dy:Number = (stage.stageHeight/2 -	e.target.y)/SPEED;
			while (e.target.width < width_pic ) {
				e.target.x += dx;	
				e.target.y += dy;
				e.target.scaleX = e.target.scaleY += 1;
			}
		}
	}
}