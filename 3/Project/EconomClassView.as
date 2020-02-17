package
{
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class EconomClassView extends MovieClip
	{
		private var ball:SuperBall;
		private var model:EconomCarModel;
		private var myStage:Stage;
		public static const NEED_LEFT:String = "needLeft";
		public static const NEED_RIGHT:String = "needRight";
		public static const NEED_STOP:String = "needStop";
		public function EconomClassView(_model:EconomCarModel, _stage:Stage)
		{
			ball = new SuperBall(0x00ff00, 10);
			addChild(ball);
			model = _model;
			myStage = _stage;
			myStage.addEventListener(KeyboardEvent.KEY_DOWN, onKD);
			myStage.addEventListener(KeyboardEvent.KEY_UP, onKU);
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		protected function onKU(e:KeyboardEvent):void
		{
			dispatchEvent(new Event(NEED_STOP));
		}
		
		protected function onEF(e:Event):void
		{
			this.x += model.Speed;
		}
		
		protected function onKD(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.LEFT){
				dispatchEvent(new Event(NEED_LEFT));
			}
			if(e.keyCode == Keyboard.RIGHT){
				dispatchEvent(new Event(NEED_RIGHT));
			}
		}
		
	}
}