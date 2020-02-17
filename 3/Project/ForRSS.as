package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class ForRSS extends MovieClip
	{
		private const URLPATH:String = "http://lenta.ru/rss/top7";
		private var xml:XML;
		private var bl:BulkLoader = new BulkLoader("bl");
		public function ForRSS()
		{
			bl.add(URLPATH);
			bl.addEventListener(BulkProgressEvent.COMPLETE, onCOMP);
			bl.start();
		}
		
		protected function onCOMP(event:BulkProgressEvent):void
		{
			// получаем текст в трэйс
			var str:String = bl.getText(URLPATH);
			xml = new XML(str);
			trace(xml);
		}
	}
}