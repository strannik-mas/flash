package
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	
	public class ForTweener extends MovieClip
	{
		private var sb:SuperBall = new SuperBall(0x00faab, 25);
		public function ForTweener()
		{
			addChild(sb);
			Tweener.addTween(sb, {
				x:200, 
				y:200, 
				alpha:0.5, 
				time:3,
				transition:"easeOutBounce"
			});//в метод addTween в качестве параметров чего надо сделать с объектом передаются его свойства
			
		}
	}
}