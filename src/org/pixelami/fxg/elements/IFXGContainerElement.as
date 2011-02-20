package org.pixelami.fxg.elements
{
	public interface IFXGContainerElement
	{
		function set children(value:Vector.<IFXGElement>):void;
		function get children():Vector.<IFXGElement>;
	}
}