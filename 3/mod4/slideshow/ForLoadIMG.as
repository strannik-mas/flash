package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public dynamic class ForLoadIMG extends MovieClip
	{
		private var blIMG:BulkLoader;
		private var my_addr:String;
		public function ForLoadIMG(addr:String, bl2:BulkLoader)
		{
			my_addr = addr;
			blIMG = bl2;
			blIMG.add(my_addr);
			blIMG.addEventListener(BulkProgressEvent.COMPLETE, onLI);
			blIMG.start();
		}
		
		protected function onLI(e:BulkProgressEvent):void
		{
			var bm:Bitmap = blIMG.getBitmap(my_addr);
			addChild(bm);
			bm.scaleX = bm.scaleY =.3;
		}
	}
}