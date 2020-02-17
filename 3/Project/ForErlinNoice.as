package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	
	public class ForErlinNoice extends MovieClip
	{
		public function ForErlinNoice()
		{
			var bmd:BitmapData = new BitmapData(300, 100);
			bmd.perlinNoise(10,10,5,10,true,true);
			var bm:Bitmap = new Bitmap(bmd);
			addChild(bm);
		}
	}
}