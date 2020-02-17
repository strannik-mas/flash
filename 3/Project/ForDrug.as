package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class ForDrug extends MovieClip
	{
		private var sb:SuperBall = new SuperBall(0x0123fa, 40);
		public function ForDrug()
		{
			addChild(sb);
			sb.addEventListener(MouseEvent.MOUSE_DOWN, onMD);
			sb.addEventListener(MouseEvent.MOUSE_UP, onMU);
			stage.addEventListener(Event.MOUSE_LEAVE, onML);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMU);
		}
		
		protected function onML(event:Event):void
		{
			sb.stopDrag();
			
		}
		
		protected function onMU(event:MouseEvent):void
		{
			sb.stopDrag();
		}
		
		protected function onMD(event:MouseEvent):void
		{
			var rect:Rectangle = new Rectangle(0, 0, 200, 200);
			SuperBall(event.target).startDrag(false, rect);
		}
	}
}