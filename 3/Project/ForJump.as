package
{
	import flash.display.MovieClip;
	
	public class ForJump extends MovieClip
	{
		public function ForJump()
		{
			var jb:ForJumpingBall3 = new ForJumpingBall3(0x00ff00, 20);
			addChild(jb);
			jb.startJump();
		}
	}
}