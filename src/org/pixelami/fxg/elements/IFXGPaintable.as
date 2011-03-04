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

package org.pixelami.fxg.elements
{
	import org.pixelami.fxg.elements.fills.IFXGFill;
	import org.pixelami.fxg.elements.strokes.IFXGStroke;

	public interface IFXGPaintable
	{
		function set fill(value:IFXGFill):void;
		function get fill():IFXGFill;
		
		function set stroke(value:IFXGStroke):void;
		function get stroke():IFXGStroke;
			
	}
}