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

/*
*  angle <Number>: The angle of the generated bevel. This angle is expressed in document coordinate space.
* blurX <Number>: The amount of blur applied to the rendered content in the horizontal.
* blurY <Number>: The amount of blur applied to the rendered content in the vertical.
* highlightAlpha <Number>: The transparency of the generated highlight color.
* highlightColor <Color>: The color of the generated highlight color.
* distance <Number>: The height of the bevel.
* knockout <Boolean> Renders the effect only where the value in the original content was 100% transparent. All other pixels are 100% transparent.
* quality <Number>: The quality of the rendered effect.
* shadowAlpha <Number>: The transparency of the generated shadow of the bevel.
* shadowColor <Color>: The color of the generated shadow of the bevel.
* strength <Number>: The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the bevel and the background. Valid values are from 0 to 255.0. The default is 1.0.
* type <String> (inner, outer, full): The placement of the bevel on the object. Defaults to "inner".

*/
package org.pixelami.fxg.elements.filters
{
	public class BevelFilter extends FXGFilter
	{
		public function BevelFilter()
		{
			super();
		}
	}
}