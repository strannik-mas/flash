package
{
	import flash.display.MovieClip;
	
	public class ForMultipleFlying extends MovieClip
	{
		public function ForMultipleFlying()
		{
			for (var i:int = 0; i < 10; i++) 
			{
				var fb:FlyingBall = new FlyingBall(stage);
				addChild(fb);
				fb.y=200;
				fb.x = 100+4*i;
			}
			
		}
	}
}