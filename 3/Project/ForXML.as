package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import caurina.transitions.Tweener;
	
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ForXML extends MovieClip
	{
		private var xml:XML;
		private var bl:BulkLoader = new BulkLoader("bl");
		public function ForXML()
		{
			bl.add("gal.xml");
			bl.addEventListener(BulkProgressEvent.COMPLETE, onCOMP);
			bl.start();
		}
		
		protected function onCOMP(e:BulkProgressEvent):void
		{
			xml = bl.getXML("gal.xml");
			bl.removeEventListener(BulkProgressEvent.COMPLETE, onCOMP);
			for (var i:int = 0; i < xml.item.length(); i++) 
			{
				bl.add(xml.item[i].@url.toString());
			}
			bl.addEventListener(BulkProgressEvent.COMPLETE, onIMGLoad);
			bl.start();
		}
		
		protected function onIMGLoad(event:Event):void
		{
			for (var i:int = 0; i < xml.item.length(); i++) 
			{
				var bm:Bitmap = bl.getBitmap(xml.item[i].@url.toString());
				var mc:MovieClip = new MovieClip();
				addChild(mc);
				mc.addChild(bm);
				bm.scaleX=bm.scaleY = .3;
				mc.x = i*150;
				mc.addEventListener(MouseEvent.CLICK, onMcClick);
				mc.startX = mc.x;
				mc.startY = mc.y;
			}
			
		}
		
		protected function onMcClick(e:MouseEvent):void
		{
			addChild(MovieClip(e.target));
			//выезд
			e.target.removeEventListener(MouseEvent.CLICK, onMcClick);
			Tweener.addTween(e.target,{
				scaleX: 3,
				scaleY: 3,
				x: (stage.stageWidth - e.target.width*3)/2,
				y: (stage.stageHeight - e.target.height*3)/2,
				time:0.5,
				onComplete:inTheHouse,
				onCompleteParams:[e.target]
			});
		}
		private function inTheHouse(target:MovieClip):void{
			target.addEventListener(MouseEvent.CLICK, goHome);
		}
		
		protected function goHome(e:MouseEvent):void
		{
			// ставим на место
			e.target.removeEventListener(MouseEvent.CLICK, goHome);
			Tweener.addTween(e.target,{
				scaleX: 1,
				scaleY: 1,
				x: e.target.startX,
				y: e.target.startY,
				time:0.5,
				onComplete:inTheHome,
				onCompleteParams:[e.target]
			});
		}
		private function inTheHome(target:MovieClip):void{
			target.addEventListener(MouseEvent.CLICK, onMcClick);
		}
	}
}