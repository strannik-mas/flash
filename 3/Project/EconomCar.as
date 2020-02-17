package
{
	import flash.display.MovieClip;
	
	public class EconomCar extends MovieClip
	{
		private var model:EconomCarModel;
		private var view:EconomClassView;
		private var controller:EconomCarController;
		public function EconomCar()
		{
			model = new EconomCarModel(0);
			view = new EconomClassView(model, stage);
			addChild(view);
			controller = new EconomCarController(view, model);
			controller.play();
		}
	}
}