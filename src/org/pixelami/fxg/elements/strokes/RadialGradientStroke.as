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
 * RadialGradient
 * 
 * The RadialGradient element fills a path or shape with a continuously smooth color transition between a list of colors along the radius of a circle.
 * The circle used is the circle bounded by the box stretching from (-0.5, -0.5) to (0.5,0.5). Like LinearGradient, it is transformed by the matrix transform defined on the gradient.
 * RadialGradient supports all the same transform attributes and child elements that LinearGradient does. Additionally, because its rendering is defined by a box and not just a horizontal vector, it supports a scaleY attribute that is used along with scaleX to scale the bounding box before the other transform attributes are applied.
 * RadialGradient elements also define the attribute focalPointRatio. This defines where along the horizontal axis (of the untransformed box) the focal point of the radial gradient lies. A value of 1 places it at the right hand edge of the box (at 0.5,0). A value of -1 places it at the left hand edge of the box (at -0.5,0).
 *
 * RadialGradient elements use child GradientEntry elements the same way LinearGradient elements do.
 */

/*
Children

* GradientEntry
* matrix

Attributes

* x <Number>: The horizontal translation of the gradient transform that defines the horizontal center of the gradient.
* y <Number>: The vertical translation of the gradient transform that defines the vertical center of the gradient.
* scaleX <Number>: The horizontal scale of the gradient transform that defines the width of the (unrotated) gradient.
* scaleY <Number>: The vertical scale of the gradient transform that defines the width of the (unrotated) gradient.
* rotation <Number> (<angle>): The rotation of the gradient transform.
* spreadMethod <String> (pad, reflect, repeat): How to choose the fill of pixels outside the gradient vector.
* interpolationMethod <String> (rgb, linearRGB): How to interpolate between entries of the gradient.
* focalPointRatio <Number>: The placement of the focal point of the radial gradient along the horizontal center axis of the gradient bounding box. A value of 1 lies against the right edge of the box; a value of -1 lies against the left edge. The default value of 0 places it in the middle of the box.

*/
package org.pixelami.fxg.elements.strokes
{
	public class RadialGradientStroke implements IFXGStroke
	{
		public function RadialGradientStroke()
		{
		}
	}
}