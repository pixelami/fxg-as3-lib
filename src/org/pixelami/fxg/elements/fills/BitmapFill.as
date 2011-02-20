/*
Children

* matrix

Attributes

* x <Number>: The horizontal translation of the transform that defines the horizontal center of the gradient.
* y <Number>: The vertical translation of the transform that defines the vertical center of the gradient.
* scaleX <Number>: The horizontal scale of the transform that defines the width of the (unrotated) gradient.
* scaleY <Number>: The vertical scale of the transform that defines the width of the (unrotated) gradient.
* rotation <Number> (<angle>): The rotation of the transform.
* transformX <Number>: The horizontal point of origin for the scale and rotation portions of the transform.
* transformY <Number>: The vertical point of origin for the scale and rotation portions of the transform.
* source <embedded bitmap>: A reference to the file containing the image data to use as fill.
* repeat <Boolean>: Whether the image data should be rendered once, or tiled to fill an infinite plane.

*/
package org.pixelami.fxg.elements.fills
{
	public class BitmapFill extends FXGFill implements IFXGFill
	{
		public function BitmapFill()
		{
			super();
		}
	}
}