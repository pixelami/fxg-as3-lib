////////////////////////////////////////////////////////////////////////////////
//
//  Pixelami
//  Copyright 2011 Original Authors (Alexander Syed et al)
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

/**
 * LinearGradientStroke
 * 
 * The LinearGradientStroke paints a stroke along a path or shape with a continuously smooth color transition between a list of colors along a vector. 
 * The LinearGradientStroke operates almost identically to the LinearGradient fill type. As with the fill, By default, a LinearGradientStroke is transformed to fill the bounding box of the path being stroked. The bounding box is computed by computing the bounding box of the anchor points of the path, and expanding its borders outward in each direction by half the weight of the stroke.
 * Otherwise its rendering behavior is identical to that of the LinearGradientFill.
 */

/*
Children

* matrix
* GradientEntry

Attributes

* x <Number>: The horizontal translation of the gradient transform that defines the horizontal center of the gradient.
* y <Number>: The vertical translation of the gradient transform that defines the vertical center of the gradient.
* scaleX <Number>: The horizontal scale of the gradient transform that defines the width of the (unrotated) gradient.
* rotation <Number> (<angle>): The rotation of the gradient transform.
* spreadMethod <String> (pad, reflect, repeat): How to choose the fill of pixels outside the gradient vector.
* interpolationMethod <String> (rgb, linearRGB): How to interpolate between entries of the gradient.
* scaleMode <String> (normal, none, vertical, horizontal): A value that specifies which scale mode to use. Defaults to "normal".
* caps <String> (none, round, square): A value that specifies the type of caps at the end of lines. Defaults to "none".
* joints <String> (bevel, miter, round): A value that specifies the type of joint appearance used at angles. Defaults to "round".
* miterLimit <Number>: A number that indicates the limit at which a miter is cut off. Valid values range from 0 to 255.
*/
package org.pixelami.fxg.elements.strokes
{
	
	public class LinearGradientStroke  implements IFXGStroke
	{
		public function LinearGradientStroke()
		{
			super();
		}
	}
}