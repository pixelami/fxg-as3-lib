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