package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class ForBitmapPrint extends MovieClip
	{
		private var bl:BulkLoader = new BulkLoader("BL1");
		public function ForBitmapPrint()
		{
			bl.add("main.jpg");
			bl.addEventListener(BulkProgressEvent.COMPLETE, onCOMP);
			bl.start();
		}
		
		protected function onCOMP(e:BulkProgressEvent):void
		{
			var bmd:BitmapData = bl.getBitmapData("main.jpg");
			var bmd2:BitmapData = new BitmapData(bmd.width, bmd.height);
			for (var i:uint = 0; i < bmd.height; i++) 
			{
//				var str:String = "";
				for (var j:uint = 0; j < bmd.width; j++) 
				{
					
					if(bmd.getPixel(j,i)>0x777777){
						bmd2.setPixel(j,i, 0x00fa12);
//						str += "_";
					}else{
						bmd2.setPixel(j,i, 0xff0000);
//						str += ".";
					}
				}
//				trace(str);
				
			}
			var bm:Bitmap = new Bitmap(bmd);
			addChild(bm);
			var bm2:Bitmap = new Bitmap(bmd2);
			addChild(bm2);
			bm2.x = bm.width;
		}
	}
}