package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class JumpingBall extends MovieClip
	{
		private var sjb:SuperJumpingBall = new SuperJumpingBall
			(0x00fa00, 40, 2, stage);
		public function JumpingBall()
		{
			addChild(sjb);
//			sjb.addEventListener(sjb.UPAL, onUPAL);
			sjb.addEventListener(SuperJumpingBall.UPAL, onUPAL);//тут нужно, чтоб константа была статическая
		}
		
		protected function onUPAL(e:Event):void
		{
			e.target.x += 20;
		}
	}
}