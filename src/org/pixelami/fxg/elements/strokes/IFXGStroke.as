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

package org.pixelami.fxg.elements.strokes
{
	import flash.display.Graphics;
	import org.pixelami.fxg.elements.IFXGElement;

	public interface IFXGStroke extends IFXGElement
	{
		function doStroke(value:Graphics):void;
	}
}