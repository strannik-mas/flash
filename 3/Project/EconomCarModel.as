package
{
	import flash.display.MovieClip;
	
	public class EconomCarModel extends MovieClip
	{
		private var speed:int;
		public function EconomCarModel(_speed:int)
		{
			speed=_speed;
		}
		public function set Speed(sp:int){
			speed= sp;
		}
		public function get Speed():int
		{
			return speed;
		}
	}
}