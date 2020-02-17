package
{
	import flash.display.MovieClip;
	
	public class ForMultipleJumpingBall extends MovieClip
	{
		public function ForMultipleJumpingBall()
		{
			for (var i:int = 0; i < 50; i++) 
			{
				/*var sjb:SuperJumpingBall = new SuperJumpingBall(
					Math.random()*0xffffff, Math.random()*50, Math.random()*10, stage);
				addChild(sjb);
				sjb.x= Math.random()*stage.stageWidth;
				sjb.y = Math.random()*stage.stageHeight;*/
				var sjb:SuperJumpingBall = new SuperJumpingBall(
					Math.random()*0xffffff, i+5, i, stage);
				addChild(sjb);
				sjb.x= i*10;
			}
			
		}
	}
}