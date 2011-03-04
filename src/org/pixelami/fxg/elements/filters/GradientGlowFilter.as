////////////////////////////////////////////////////////////////////////////////
//
//  pixelami.com
//  Copyright 2011 Original Authors (Alexander Syed et al)
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

/*
Attributes 

* angle <Number>: The angle of the generated glow. This angle is expressed in document coordinate space.
* blurX <Number>: The amount of blur applied to the rendered content in the horizontal.
* blurY <Number>: The amount of blur applied to the rendered content in the horizontal.
* distance <Number>: The offset between the element content and the rendered glow in the output.
* inner <Boolean>: If true, glow values are rendered above the original source content, and masked by the original content. If false, it is rendered below the original content.
* knockout <Boolean>: Renders the effect only where the value in the original content was 100% transparent. All other pixels are 100% transparent.
* quality <Number>: The quality of the rendered effect. Defaults to 1.
* strength <Number>: The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the glow and the background. Valid values are 0 to 255. The default is 2.
*/
package org.pixelami.fxg.elements.filters
{
	/**
	 * <p>Applies a Glow effect to the input element, using a specified gradient to fill the glow rather than a single color.
	 * </p>
	 * <p>The gradient used in a GradientGlow is specified using child GradientEntry elements. See the section on gradient fills for more details.
	 * </p>
	 */
	public class GradientGlowFilter extends FXGFilter
	{
		public function GradientGlowFilter()
		{
			super();
		}
	}
}