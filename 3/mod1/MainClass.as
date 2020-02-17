package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	public class MainClass extends MovieClip
	{
		private var as_mc:MyBall = new MyBall();
		private const SPEED:Number = 10;
		private var left:Boolean = false;
		private var right:Boolean = false;
		private var up:Boolean = false;
		private var down:Boolean = false;
		public function MainClass()
		{
			//as_mc.rotation = 45;
			//MovieClip(as_mc).rotation = 45;
			//as_mc.rotation += 45;
			addChild(as_mc);
			//as_mc.addEventListener(Event.ENTER_FRAME, onEF);
			//as_mc.addEventListener(MouseEvent.MOUSE_DOWN, onEF);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKD);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKU);
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		private function onEF(e:Event){
			//as_mc.x +=10;
			//e.target.x +=10;
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
		private function onKD(e:KeyboardEvent){
			if (e.keyCode == Keyboard.DOWN){
				//as_mc.y += SPEED;
				down = true;
			}else if(e.keyCode == Keyboard.UP){
				//as_mc.y -= SPEED;		
				up = true;
			}else if(e.keyCode == Keyboard.LEFT){
				left = true;
			}else if(e.keyCode == Keyboard.RIGHT){
				//as_mc.x += SPEED;			
				right = true;
			}
		}
		private function onKU(e:KeyboardEvent){
			if (e.keyCode == Keyboard.DOWN){
				down = false;
			}else if(e.keyCode == Keyboard.UP){
				up = false;
			}else if(e.keyCode == Keyboard.LEFT){
				left = false;
			}else if(e.keyCode == Keyboard.RIGHT){
				right = false;
			}
		}
	}
}