package
{
	import caurina.transitions.Tweener;

	public class ForJumpingBall3 extends SuperBall
	{
		public function ForJumpingBall3(color:uint, radius:uint)
		{
			super(color, radius);
			
		}
		public function startJump(){
			goDown();
		}
		protected function goDown(){
			Tweener.addTween(this, {
				y:200,
				time:1,
				onComplete:goUp
			});
		}
		private function goUp(){
			Tweener.addTween(this, {
				y:0,
				time:1,
				onComplete:goDown
			});
		}
	}
}