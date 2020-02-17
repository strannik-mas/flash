package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.core.math.Sphere3D;
	import org.papervision3d.materials.BitmapFileMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	
	public class ForPaperVision extends MovieClip
	{
		private var scene:Scene3D = new Scene3D();
		private var view:Viewport3D = new Viewport3D();
		private var camera:Camera3D = new Camera3D();
		private var render:BasicRenderEngine = new BasicRenderEngine();
		
		private var sphere:Sphere;
		private var do3d:DisplayObject3D = new DisplayObject3D();
		public function ForPaperVision()
		{
			//viewport невидим, поэтому его надо добавить на сцену
			addChild(view);
			var mat:BitmapFileMaterial = new BitmapFileMaterial("images/earth.jpg");
			var matLuna:BitmapFileMaterial = new BitmapFileMaterial("images/luna.jpg");
			sphere = new Sphere(mat, 250, 20, 20);
			scene.addChild(sphere);
			scene.addChild(do3d);
			
			
			var luna:Sphere = new Sphere(matLuna, 50, 20, 20);
			do3d.addChild(luna);
			luna.x = 300;
			luna.y = 200;
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		protected function onEF(e:Event):void
		{
			// рендерим сцену
			render.renderScene(scene, camera, view);
//			sphere.rotationX = 27;
			do3d.rotationY +=2;
			do3d.rotationX ++;
			sphere.rotationY ++;
		}
	}
}