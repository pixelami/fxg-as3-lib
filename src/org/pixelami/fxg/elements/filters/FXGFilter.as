////////////////////////////////////////////////////////////////////////////////
//
//  pixelami.com
//  Copyright 2011 Original Authors
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
		private var _quality:Number = 2;
		
		/**
		 * The quality of the rendered effect.
		 */
		public function get quality():Number
		{
			return _quality;
		}

		public function set quality(value:Number):void
		{
			_quality = value;
		}

		
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