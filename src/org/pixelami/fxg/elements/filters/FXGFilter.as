package org.pixelami.fxg.elements.filters
{
	public class FXGFilter implements IFXGFilter
	{
		public function FXGFilter()
		{
		}
		
		public function getFilter():*
		{
			return null;
		}
		private var _element:XML;
		public function set element(value:XML):void
		{
			_element = value;
		}
		
		public function get element():XML
		{
			return _element;
		}
	}
}