package
{
	import flash.display.MovieClip;
	
	public class SuperBall extends MovieClip
	{
		private var col:uint;
		public function SuperBall(color:uint, radius:uint)
		{
			graphics.lineStyle(2,0);
			graphics.beginFill(color);
			graphics.drawCircle(radius,radius,radius);
			col = color;
			
		}
		public function getColor():uint{
			return col;
		}
	}
}