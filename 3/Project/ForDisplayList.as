package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class ForDisplayList extends MovieClip
	{
		public function ForDisplayList()
		{
			for(var i:uint = 0; i<30; i++){
				var as_mc:MyBall = new MyBall();
				as_mc.x = Math.random()*stage.stageWidth;
				as_mc.y = Math.random()*stage.stageHeight;
				addChild(as_mc);
			}
			addEventListener(MouseEvent.MOUSE_OVER, onMO);
			trace(numChildren);
		}
		private function onMO (e:MouseEvent){
			e.currentTarget.x ++;
		}
	}
}