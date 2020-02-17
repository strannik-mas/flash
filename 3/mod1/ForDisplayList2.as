package
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class ForDisplayList2 extends MovieClip
	{
		public function ForDisplayList2()
		{
			for (var i:int = 0; i < 50; i++) 
			{
				var as_mc:MyBall = new MyBall();
				addChild(as_mc);
			}
			this.addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		protected function onEF(event:Event):void
		{
			this.getChildAt(0).x += (mouseX-this.getChildAt(0).x)/5;
			this.getChildAt(0).y += (mouseY-this.getChildAt(0).y)/5;
			for (var i:int = 1; i < this.numChildren; i++) 
			{
				var me:MyBall = MyBall(this.getChildAt(i));
				var sosed:MyBall = MyBall(this.getChildAt(i-1));
				me.x += (sosed.x - me.x)/5;
				me.y += (sosed.y - me.y)/5;
			}
			
		}
	}
}