package
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	import org.papervision3d.cameras.Camera3D;
	import org.papervision3d.materials.ColorMaterial;
	import org.papervision3d.materials.MovieMaterial;
	import org.papervision3d.materials.utils.MaterialsList;
	import org.papervision3d.objects.primitives.Cube;
	import org.papervision3d.objects.primitives.Cylinder;
	import org.papervision3d.objects.primitives.Plane;
	import org.papervision3d.render.BasicRenderEngine;
	import org.papervision3d.scenes.Scene3D;
	import org.papervision3d.view.Viewport3D;
	
	public class ForPremitivs extends MovieClip
	{
		private var scene:Scene3D = new Scene3D();
		private var view:Viewport3D = new Viewport3D();
		private var cam:Camera3D = new Camera3D();
//		var plane:Cylinder = new Cylinder();
		private var cube:Cube;
		private var render:BasicRenderEngine = new BasicRenderEngine();
		public function ForPremitivs()
		{
			var matList:MaterialsList = new MaterialsList();
			var red:ColorMaterial = new ColorMaterial(0xff0000);
			var green:ColorMaterial = new ColorMaterial(0x00ff00);
			var blue:ColorMaterial = new ColorMaterial(0x0000ff);
			matList.addMaterial(red, "left");
			matList.addMaterial(green, 'right');
			matList.addMaterial(blue, "top");
			matList.addMaterial(red, "bottom");
			matList.addMaterial(green, 'back');
			matList.addMaterial(blue, "front");
			addChild(view);
			cube = new Cube(matList);
			scene.addChild(cube);
			addEventListener(Event.ENTER_FRAME, onEF);
		}
		
		protected function onEF(e:Event):void
		{
			render.renderScene(scene, cam, view);
			cube.rotationY = mouseX;
			cube.rotationX = mouseY;
//			plane.geometry.vertices[0].x = mouseX - view.width/2;
//			plane.geometry.vertices[0].z = -900;
			
		}
	}
}