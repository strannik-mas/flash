package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import flashx.textLayout.conversion.PlainTextExporter;
	
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.core.effects.AbstractEffect;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.objects.DisplayObject3D;
	import org.papervision3d.objects.primitives.Arrow;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.objects.primitives.Sphere;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	
	public class ForArrow extends MovieClip
	{
		private var scene:Scene3D = new Scene3D();
		private var view:Viewport3D = new Viewport3D();
		private var camera:Camera3D = new Camera3D();
		private var render:BasicRenderEngine = new BasicRenderEngine();
		private var arrow:Arrow;
		private var sphere:Sphere = new Sphere(null, 300, 20,20);
		private var do3d:DisplayObject3D = new DisplayObject3D();
		public function ForArrow()
		{
			addChild(view);
			scene.addChild(do3d);
			for (var i:uint = 0; i < sphere.geometry.vertices.length; i++) 
			{
				var mat:ColorMaterial = new ColorMaterial(0xffffff*Math.random());
				mat.doubleSided = true;
				var pl:Plane = new Plane(mat, 10, 10);
				do3d.addChild(pl);
				pl.x = sphere.geometry.vertices[i].x;
				pl.y = sphere.geometry.vertices[i].y;
				pl.z = sphere.geometry.vertices[i].z;
				pl.localRotationY = -Math.atan2(pl.x, pl.z) * 180/Math.PI;
			}
			
			/*arrow = new Arrow();
			scene.addChild(arrow);*/
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		protected function onEF(e:Event):void
		{
			render.renderScene(scene, camera, view);
			do3d.rotationY++;
			
		}
	}
}