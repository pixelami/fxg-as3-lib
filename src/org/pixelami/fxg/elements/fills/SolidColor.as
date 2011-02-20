/*
Children

None.

Attributes

* alpha <Number>: A real number value ranging from 0 to 1 specifying the opacity of the fill, with 1 being opaque. Defaults to 1.
* color <Color>: An RGB value (in the form #rrggbb) that defines the single color value to fill the shape with. Defaults to #000000.

*/
package org.pixelami.fxg.elements.fills
{
	import flash.display.Graphics;

	public class SolidColor extends FXGFill
	{
		
		public function SolidColor()
		{
		}
		
		
		override public function beginFill(value:Graphics):void
		{
			value.beginFill(color,alpha);
		}
	}
}