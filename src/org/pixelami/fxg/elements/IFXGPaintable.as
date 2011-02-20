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