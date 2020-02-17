package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class MainClass extends MovieClip
	{
		public function MainClass()
		{
			var as_mc:MyBall = new MyBall();
			as_mc.rotation += 45;
			addChild(as_mc);
			as_mc.addEventListener(Event.ENTER_FRAME, onEF);
			as_mc.addEventListener(MouseEvent.MOUSE_DOWN, onEF);
		}
		private function onEF (e:MouseEvent){
			e.target.x += 10;
		}
	}
}