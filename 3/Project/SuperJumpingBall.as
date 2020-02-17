package
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	
	public class SuperJumpingBall extends MovieClip
	{
		private var sb:SuperBall;
		private var time:uint;
		private var stage1:Stage;
		public static const UPAL:String = "upal";
		public function SuperJumpingBall(_color:uint, _radius:uint, _time:uint, _stage:Stage)
		{
			time = _time;
			(time == 0) ? time=0.1 : null;
			stage1 = _stage; // нельзя использовать объект stage в таком классе, поскольку он не является основным классом приложения
			// приходится его передавать как параметр
			/*if (time == 0) 
			{
				time=1;
			}*/
			sb= new SuperBall(_color, _radius);
			addChild(sb);
			goDown();
		}
		private function goDown(){
			Tweener.addTween(sb, {
				y:200,
//				y:stage1.stageHeight-this.height,
				time:time,
				transition:"easeInQuad",
				onComplete:goUp
				//onCompleteParams:[10, 20, 30] - так можно передать параметры в goUp
			});
		}
		private function goUp(){
			var myEvent:Event = new Event(UPAL);
			dispatchEvent(myEvent);
			Tweener.addTween(sb, {
				y:0,
				time:time,
				transition:"easeOutQuad",
				onComplete:goDown
			});
		}
	}
}