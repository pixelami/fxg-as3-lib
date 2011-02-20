package org.pixelami.fxg.elements
{
	
	[DefaultProperty("children")]
	public class FXGContainerElement implements IFXGContainerElement
	{
		public function FXGContainerElement()
		{
		}
		
		private var _children:Vector.<IFXGElement>;
		
		
		public function get children():Vector.<IFXGElement>
		{
			return _children;
		}

		public function set children(value:Vector.<IFXGElement>):void
		{
			_children = value;
		}


	}
}