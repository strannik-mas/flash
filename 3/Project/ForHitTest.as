package
{
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class ForHitTest extends MovieClip
	{
		private var speed:uint = 10;
		private var road:MovieClip;
		private var sb:SuperBall = new SuperBall(0xff0000, 3);
		public function ForHitTest()
		{
			road = MovieClip(road_mc);
			
			addChild(sb);
			sb.x=250;
			sb.y=200;
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKD);
		}
		
		protected function onKD(e:KeyboardEvent):void
		{
//			trace(mouseX);
			if (e.keyCode == Keyboard.LEFT){
				if(road.hitTestPoint(sb.x-speed, sb.y, true)){
					sb.x -=speed;
				}
			}
			if (e.keyCode == Keyboard.RIGHT){
				if(road.hitTestPoint(sb.x+speed, sb.y, true)){
					sb.x +=speed;
				}
			}
			if (e.keyCode == Keyboard.UP){
				if(road.hitTestPoint(sb.x, sb.y-speed, true)){
					sb.y -=speed;
				}
			}
			if (e.keyCode == Keyboard.DOWN){
				if(road.hitTestPoint(sb.x, sb.y+speed, true)){
					sb.y +=speed;
				}
			}
		}
	}
}