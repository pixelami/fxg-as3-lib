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

package org.pixelami.fxg.elements.fills
{
	import flash.display.Graphics;
	
	import org.pixelami.fxg.elements.IFXGElement;
	import org.pixelami.fxg.elements.strokes.IFXGStroke;

	public interface IFXGFill extends IFXGElement
	{
		function beginFill(value:Graphics):void;
		function endFill(value:Graphics):void;
	}
}