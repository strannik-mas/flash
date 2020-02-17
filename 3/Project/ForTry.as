package
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class ForTry extends MovieClip
	{
		public function ForTry()
		{
			var sp:Sprite = new Sprite();
			
			try{
				sb.addChild(sp);
			}catch(e:Error){
				trace("dd");
			}
			
			
		}
	}
}