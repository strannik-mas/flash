package
{
	public class AutoJumpingBall extends ForJumpingBall3
	{
		public function AutoJumpingBall(color:uint, radius:uint)
		{
			super(color, radius);
			goDown();
		}
	}
}