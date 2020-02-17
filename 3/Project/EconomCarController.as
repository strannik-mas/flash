package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class EconomCarController extends MovieClip
	{
		private var view:EconomClassView;
		private var model:EconomCarModel;
		public function EconomCarController(_view:EconomClassView, _model:EconomCarModel)
		{
			view = _view;
			model = _model;
			view.addEventListener(EconomClassView.NEED_LEFT, onLeft);
			view.addEventListener(EconomClassView.NEED_RIGHT, onRight);
			view.addEventListener(EconomClassView.NEED_STOP, onStop);
		}
		
		protected function onStop(e:Event):void
		{
			// останавливаем, если не нажата кнопка вверх
			model.Speed = 0;
		}
		
		protected function onLeft(e:Event):void
		{
			model.Speed = -10;
		}
		
		protected function onRight(e:Event):void
		{
			model.Speed = 10;
		}
		override public function play():void{
			//вызов родительского метода play
			//super.play();
			trace ("ddd");
		}
	}
}