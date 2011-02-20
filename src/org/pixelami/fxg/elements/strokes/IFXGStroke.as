package org.pixelami.fxg.elements.strokes
{
	import flash.display.Graphics;
	import org.pixelami.fxg.elements.IFXGElement;

	public interface IFXGStroke extends IFXGElement
	{
		function doStroke(value:Graphics):void;
	}
}