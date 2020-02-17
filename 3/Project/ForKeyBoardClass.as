package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class ForKeyBoardClass extends MovieClip
	{
		private var as_mc:MyBall = new MyBall();
		private const SPEED:Number = 10;
		private var left:Boolean = false;
		private var right:Boolean = false;
		private var up:Boolean = false;
		private var down:Boolean = false;
		public function ForKeyBoardClass()
		{
			addChild(as_mc);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKD);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKU);
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		private function onEF (e:Event){
			if(left){
				as_mc.x -= SPEED;
			}
			if(right){
				as_mc.x += SPEED;
			}
			if(up){
				as_mc.y -= SPEED;
			}
			if(down){
				as_mc.y += SPEED;
			}
		}
		
		private function onKU (e:KeyboardEvent){
			if(e.keyCode == Keyboard.LEFT){
				left = false;
			}
			if(e.keyCode == Keyboard.RIGHT){
				right = false;
			}
			if(e.keyCode == Keyboard.UP){
				up = false;
			}
			if(e.keyCode == Keyboard.DOWN){
				down = false;
			}
		}
		private function onKD (e:KeyboardEvent){
			if(e.keyCode == Keyboard.LEFT){
				left = true;
			}
			if(e.keyCode == Keyboard.RIGHT){
				right = true;
			}
			if(e.keyCode == Keyboard.UP){
				up = true;
			}
			if(e.keyCode == Keyboard.DOWN){
				down = true;
			}
		}
	}
}