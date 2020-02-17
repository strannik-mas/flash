package
{
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	
	public class ForLoader extends MovieClip
	{
		public function ForLoader()
		{
			var loader:Loader = new Loader();
			var url:URLRequest = new URLRequest("images/img1.jpg");
			loader.load(url);
			addChild(loader);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onPR);
		}
		
		protected function onPR(event:ProgressEvent):void
		{
//			trace(event.bytesLoaded);
		}
	}
}