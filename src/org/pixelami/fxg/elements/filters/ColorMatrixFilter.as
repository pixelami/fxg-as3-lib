/*
ColorMatrixFilter

The ColorMatrixFilter class lets you apply a 4x5 matrix transformation on the RGBA color and alpha values of every pixel in the input image to produce a result with a new set of RGBA color and alpha values. It allows saturation changes, hue rotation, luminance to alpha, and various other effects.
Attributes 

* matrix: A comma-delimited list of 20 doubles that comprise a 4x5 matrix applied to the rendered element.  The matrix is in row major order---that is, the first five elements are multiplied by the vector [srcR,srcG,srcB,srcA,1] to determine the output red value, the second five determine the output green value, etc.

*/
package org.pixelami.fxg.elements.filters
{
	public class ColorMatrixFilter extends FXGFilter
	{
		public function ColorMatrixFilter()
		{
			super();
		}
	}
}