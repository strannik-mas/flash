package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
		
	public class ForDisplayList extends MovieClip
	{
		public function ForDisplayList()
		{
			for (var i:uint = 0; i<30; i++){
				var as_mc:MyBall = new MyBall();
				as_mc.x = Math.random()*stage.stageWidth;
				as_mc.y = Math.random()*stage.stageHeight;
				addChild(as_mc);
				//as_mc.addEventListener(MouseEvent.MOUSE_OVER, onMO);
			}
			addEventListener(MouseEvent.MOUSE_OVER, onMO);
			trace(numChildren);
		}
		
		protected function onMO(event:MouseEvent)
		{
			//event.target.x +=10;
			//приведение типа нужно для strict mode
			//removeChild(MyBall(event.target));
			
			var nc:uint = numChildren;
			for (var i:int = 0; i < nc; i++) 
			{
				removeChildAt(0);
			}
			
			
		}		
		
	}
}