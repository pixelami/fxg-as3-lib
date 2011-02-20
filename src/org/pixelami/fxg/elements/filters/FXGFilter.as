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