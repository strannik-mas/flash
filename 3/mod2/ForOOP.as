package
{
	import flash.display.MovieClip;
	
	public class ForOOP extends MovieClip
	{
		public function ForOOP()
		{
			for (var i:int = 0; i < 30; i++) 
			{
				var as_mc:SuperBall = 
					new SuperBall(Math.random()*0xffffff, Math.random()*30);
				addChild(as_mc);
				as_mc.x = Math.random()*stage.stageWidth;
				as_mc.y = Math.random()*stage.stageHeight;
			}
			
		}
	}
}