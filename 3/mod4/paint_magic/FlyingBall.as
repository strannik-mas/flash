package
{
	import caurina.transitions.Tweener;
	
	import flash.display.MovieClip;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class FlyingBall extends MovieClip
	{
		private const SPEED:uint = 10;
		public static const UPAL:String = "upal";
		private var as_mc:FBall = new FBall();
		private var fX:uint;
		private var fY:uint;
		private var nachX:uint;
		private var nachY:uint;
		public function FlyingBall(_color:uint)
		{
				/*as_mc.x = nachX =  Math.random()*stage1.stageWidth;
				as_mc.y = nachY =  Math.random()*stage1.stageHeight;*/
				addChild(as_mc);
				as_mc.scaleX = as_mc.scaleY = .5;
				as_mc.graphics.beginFill(_color);
				as_mc.graphics.drawCircle(0,0, 3.5);
				as_mc.addEventListener(MouseEvent.MOUSE_OVER, onMO);
		
			
		}
		
		protected function onMO(event:MouseEvent):void
		{
			Tweener.addTween(as_mc, {
				x:Math.random()*stage.stageWidth-200,
				y:Math.random()*stage.stageHeight-200,
				time:7,
				alpha:0, 
				transition:"easeOutQuart",
				onComplete:goUp
			});
			/*fX = Math.random()*stage1.stageWidth - as_mc.width/2;
			fY = Math.random()*stage1.stageHeight - as_mc.height/2;*/
			
			// делаем таймер
			/*var timer:Timer = new Timer(25, 100);
			timer.start();
			timer.addEventListener(TimerEvent.TIMER, onT);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComp);*/
			
		}
		private function goUp(){
			var myEvent:Event = new Event(UPAL);
			dispatchEvent(myEvent);
			Tweener.addTween(as_mc, {
				x:nachX,
				y:nachY,
				time:7,
				alpha:1,
				transition:"easeInQuart"
			});
		}
		/*protected function onTimerComp(event:TimerEvent):void
		{
			// возвращаемся
			as_mc.x += (nachX - as_mc.x);
			as_mc.y += (nachY - as_mc.y);
			
		}
		
		protected function onT(event:TimerEvent):void
		{
			// разлетаемся
			
			as_mc.x += (fX - as_mc.x)/SPEED;
			as_mc.y += (fY - as_mc.y)/SPEED;
		}*/
	}
}