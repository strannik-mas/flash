package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class ForBulkLoader extends MovieClip
	{
		private var bl:BulkLoader = new BulkLoader("first");
		public function ForBulkLoader()
		{
			bl.add("images/img1.jpg");
			bl.add("images/img2.jpg");
			bl.add("images/img3.jpg");
			bl.addEventListener(BulkProgressEvent.COMPLETE, onCOMP);
			bl.addEventListener(BulkProgressEvent.PROGRESS, onPr);
			bl.start();
		}
		
		protected function onPr(e:BulkProgressEvent):void
		{
			var per:Number = e.bytesLoaded/e.bytesTotal;
			this.graphics.lineStyle(5, 0xffffff*Math.random());
			this.graphics.lineTo(stage.stageWidth*per, stage.stageHeight/2);
		}
		
		protected function onCOMP(e:BulkProgressEvent):void
		{
			var bm:Bitmap = bl.getBitmap('images/img1.jpg');
			addChild(bm);
			this.graphics.clear();
		}
	}
}