package
{
	import flash.display.MovieClip;
	
	public class SuperBall extends MovieClip
	{
		public function SuperBall(color:uint, radius:uint)
		{
			graphics.lineStyle(2, 0);
			graphics.beginFill(color);
			graphics.drawCircle(radius, radius, radius);
			
		}
	}
}