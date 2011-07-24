////////////////////////////////////////////////////////////////////////////////
//
//  pixelami.com
//  Copyright 2011 Original Authors
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////



/*
Attributes 

* angle <Number>: The angle of the generated bevel. This angle is expressed in document coordinate space.
* blurX <Number>: The amount of blur applied to the rendered content in the horizontal.
* blurY <Number>: The amount of blur applied to the rendered content in the horizontal.
* distance <Number>: The height of the bevel.
* knockout <Boolean> Renders the effect only where the value in the original content was 100% transparent. All other pixels are 100% transparent.
* quality <Number> The quality of the rendered effect.
* strength <Number> The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the bevel and the background. Valid values are from 0 to 255.0. The default is 1.0.
* type <String> (inner, outer, full): The placement of the bevel on the object. Defaults to "inner".

Children

* GradientEntry
*/
package org.pixelami.fxg.elements.filters
{
	/**
	 * <p>Applies a Bevel effect to the input element, using a specified gradient to fill the bevel rather than a highlight and shadow color.
	 * </p>
	 * <p>The gradient used in a GradientBevel is specified using child GradientEntry elements. See the section on gradient fills for more details.
	 * </p>
	 */
	public class GradientBevelFilter extends FXGFilter
	{
		public function GradientBevelFilter()
		{
			super();
		}
	}
}