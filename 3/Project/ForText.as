package
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	public class ForText extends MovieClip
	{
		public function ForText()
		{
			var tf:TextField = new TextField();
			addChild(tf);
			tf.border = true;
			tf.type = TextFieldType.INPUT;
			tf.text = "куку!";
			tf.htmlText = "<b>Пириветик!!</b>";
			/*var mf:MyFont2 = new MyFont2();
			var tfFormat:TextFormat = new TextFormat(mf.fontName, 14, 0x0ff1fa);
			tf.embedFonts = true;
			tfFormat.underline = true;
			tfFormat.bold = true;
			tf.setTextFormat(tfFormat,0,3);
			
			tf.defaultTextFormat = tfFormat;
			tf.text = "546123456 - this my tel";*/
			tf.width = tf.textWidth+2;
			tf.height = tf.textHeight+20;
		}
	}
}