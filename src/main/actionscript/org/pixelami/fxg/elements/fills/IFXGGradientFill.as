package org.pixelami.fxg.elements.fills
{
	public interface IFXGGradientFill extends IFXGFill
	{
		function set entries(value:Vector.<GradientEntry>):void
		function get entries():Vector.<GradientEntry>
	}
}