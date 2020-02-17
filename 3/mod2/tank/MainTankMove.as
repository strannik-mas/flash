package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import fl.motion.Color;
	
	import flash.display.Graphics;
	public class MainTankMove extends MovieClip
	{
		private var tank_mc:MyTank = new MyTank;
		private const SPEED:Number = 2;
		private var left:Boolean = false;
		private var right:Boolean = false;
		private var up:Boolean = false;
		private var down:Boolean = false;
		public function MainTankMove()
		{
			tank_mc.x = 50;
			tank_mc.y = 50;
			
			this.graphics.lineStyle(2, 0xaf010f);
			this.x = tank_mc.x;
			this.y = tank_mc.y;
			this.graphics.moveTo(this.x, this.y);
			
			addChild(tank_mc);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKD);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKU);
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		protected function onEF(event:Event):void
		{
			if(left){
				if(up){
					tank_mc.rotation -= SPEED;
				}else if(down){
					tank_mc.rotation += SPEED;
				}else {
					tank_mc.rotation -= SPEED/2;
				}
			}
			if(right){
				if(up){
					tank_mc.rotation += SPEED;
				}else if(down){
					tank_mc.rotation -= SPEED;
				}else {
					tank_mc.rotation += SPEED/2;
				}
			}
			if(up){
				tank_mc.x += SPEED*Math.cos(tank_mc.rotation*Math.PI/180);
				tank_mc.y += SPEED*Math.sin(tank_mc.rotation*Math.PI/180);
			}
			if(down){
				tank_mc.x -= SPEED*Math.cos(tank_mc.rotation*Math.PI/180);
				tank_mc.y -= SPEED*Math.sin(tank_mc.rotation*Math.PI/180);
			}
			
			
			
		}
		
		protected function onKU(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.DOWN){
				down = false;
			}else if(e.keyCode == Keyboard.UP){
				up = false;
			}else if(e.keyCode == Keyboard.LEFT){
				left = false;
			}else if(e.keyCode == Keyboard.RIGHT){
				right = false;
			}
			
		}
		
		protected function onKD(e:KeyboardEvent):void
		{
			if (e.keyCode == Keyboard.DOWN){				
				down = true;
			}else if(e.keyCode == Keyboard.UP){				
				up = true;
			}else if(e.keyCode == Keyboard.LEFT){
				left = true;
			}else if(e.keyCode == Keyboard.RIGHT){					
				right = true;
			}
			//дальше код прорисовки маршрута от точки регистрации клипа
			
			this.graphics.lineTo(tank_mc.x, tank_mc.y);
		}
	}
}