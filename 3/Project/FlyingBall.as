package
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public dynamic class FlyingBall extends MovieClip
	{
		private var ball:SuperBall;
		private var stage1:Stage;
		public function FlyingBall(_stage:Stage)
		{
			stage1 = _stage;
			ball = new SuperBall(0x00ff00, 2);
			addChild(ball);
			addEventListener(MouseEvent.MOUSE_OVER, onMO);
		}
		
		protected function onMO(e:MouseEvent):void
		{
			// TODO Auto-generated method stub
			this.startX = this.x;
			this.startY = this.y;
			Tweener.addTween(this, {
				x: stage1.stageWidth*Math.random(),
				y: stage1.stageHeight*Math.random(),
				time:1,
				onComplete: inTheHouse
			});
		}
		private function inTheHouse(){
			var timer: Timer = new Timer(2000, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onCOMP);
			timer.start();
		}
		
		protected function onCOMP(e:TimerEvent):void
		{
			Tweener.addTween(this, {
				x: this.startX,
				y: this.startY,
				time:1
			});
		}
	}
}