package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	public class ForBitmapPrint2 extends MovieClip
	{
		public function ForBitmapPrint2()
		{
			var tf:TextField = new TextField();
			addChild(tf);
			tf.text = "kuku";
			var bmd:BitmapData = new BitmapData(100,100);
			bmd.draw(tf);
			var bm:Bitmap = new Bitmap(bmd);
			addChild(bm);
			bm.scaleX = bm.scaleY = 13;
			bm.rotationY = 19;
		}
	}
}