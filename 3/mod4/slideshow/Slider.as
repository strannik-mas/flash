package
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class Slider extends MovieClip
	{
		private var xml:XML;
		public var bl:BulkLoader = new BulkLoader("bl1");
		public function Slider()
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
//				trace(xml.item[i].@url.toString());
				var mc:ForLoadIMG = new ForLoadIMG(xml.item[i].@url.toString(), bl);
				addChild(mc);
				mc.x = i*150;
				mc.addEventListener(MouseEvent.CLICK, onCL);
				mc.startX = mc.x;
				mc.startY = mc.y;
			}
		}
		
		protected function onCL(e:MouseEvent):void
		{
			addChild(MovieClip(e.target)); //для того, чтобы добавить в верхнюю глубину, чтоб не перекрывался
			e.target.removeEventListener(MouseEvent.CLICK, onCL);
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
			for (var i:int = 0; i < target.parent.numChildren; i++) 
			{
				target.parent.getChildAt(i).removeEventListener(MouseEvent.CLICK, onCL);
//				trace(target.parent.getChildAt(i));
			}
			
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
			target.addEventListener(MouseEvent.CLICK, onCL);
			for (var i:int = 0; i < target.parent.numChildren; i++) 
			{
				target.parent.getChildAt(i).addEventListener(MouseEvent.CLICK, onCL);
				//				trace(target.parent.getChildAt(i));
			}
		}
	}
}