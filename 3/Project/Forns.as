package
{
	import flash.display.MovieClip;
	
	public class Forns extends MovieClip
	{
		public function Forns()
		{
			var sb:SuperBall = new SuperBall(0x00ffff, 50);
			addChild(sb);
			var a:uint = sb.getColor();
			trace(a);
		}
	}
}