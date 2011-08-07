package org.pixelami.fxg.renderer
{
	import flash.display.Sprite;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.pixelami.fxg.elements.Ellipse;
	import org.pixelami.fxg.elements.Graphic;
	import org.pixelami.fxg.elements.Group;
	import org.pixelami.fxg.elements.fills.RadialGradient;

	public class FXGRendererTest
	{		
		[Bindable]
		[Embed(source="radialGradient-01.xml",mimeType="application/octet-stream")]
		public var RadialGradientFXG01:Class
		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testRadialGradient():void
		{
			var renderer:FXGRenderer = new FXGRenderer();
			var sprite:Sprite = new Sprite();
			renderer.renderElement(new XML(new RadialGradientFXG01()),sprite);
			assertTrue(renderer.graphic is Graphic);
			var g0:Group = renderer.graphic.getChildAt(0) as Group;
			var g1:Group = g0.getChildAt(0) as Group;
			var l:uint = g1.numChildren;
			for(var i:uint = 0; i < l; i++)
			{
				trace("i",i);
				
			}
			trace("group",g1);
			var el:Ellipse = g1.getChildAt(0) as Ellipse;
			trace("el",el);
			var fill:RadialGradient = el.fill as RadialGradient;
			trace("entries",fill.entries);
			assertEquals(7,fill.entries.length);
		}
	}
}