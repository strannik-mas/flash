package
{
	import flash.events.Event;

	public interface ICarController
	{
		
		function onStop(e:Event):void;
		function onLeft(e:Event):void;
		function onRight(e:Event):void;
	}
}