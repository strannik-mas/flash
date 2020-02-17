package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class SportCarController extends MovieClip implements ICarController
	{
		private var view:EconomClassView;
		private var model:EconomCarModel;
		public function SportCarController(_view:EconomClassView, _model:EconomCarModel)
		{
			view = _view;
			model = _model;
			view.addEventListener(EconomClassView.NEED_LEFT, onLeft);
			view.addEventListener(EconomClassView.NEED_RIGHT, onRight);
			view.addEventListener(EconomClassView.NEED_STOP, onStop);
		}
		
		public function onStop(e:Event):void
		{
			model.Speed = 0;
		}
		public function onLeft(e:Event):void
		{
			model.Speed = -20;
		}
		
		public function onRight(e:Event):void
		{
			model.Speed = 20;
		}
	}
}