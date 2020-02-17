package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	
	public class ForBitmap extends MovieClip
	{
		public function ForBitmap()
		{
			var bmd:BitmapData = new BitmapData(100, 100, false, 0x00ff00);
			for (var i:int = 0; i < bmd.height; i+=2) 
			{
				for (var j:uint = 0; j < bmd.width; j+=2) 
				{
					bmd.setPixel(j, i, 0xff0000);
				}
				
			}
			
			var bm:Bitmap = new Bitmap(bmd);
			bm.smoothing = true;
			addChild(bm);
			bm.scaleX = bm.scaleY = 10;
		}
	}
}