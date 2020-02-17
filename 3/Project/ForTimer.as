package
{
	import flash.display.MovieClip;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class ForTimer extends MovieClip
	{
		private var as_mc:MyBall = new MyBall();
		public function ForTimer()
		{
			addChild(as_mc);
			var timer:Timer = new Timer(33,60);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onTimer);
		}
		private function onTimer (e:TimerEvent){
			as_mc.x ++;
		}
	}
}