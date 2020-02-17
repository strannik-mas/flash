package
{
	import flash.display.MovieClip;
	
	public class SportCar extends MovieClip
	{
		private var model:EconomCarModel;
		private var view:EconomClassView;
		private var controller:SportCarController;
		public function SportCar()
		{
			model = new EconomCarModel(0);
			view = new EconomClassView(model, stage);
			addChild(view);
			controller = new SportCarController(view, model);
		}
	}
}