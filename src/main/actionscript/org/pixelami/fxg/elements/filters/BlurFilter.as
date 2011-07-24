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
	public class BlurFilter
	{
		private var _blurX:Number;
		private var _blurY:Number;
		private var _quality:Number;
		
		/**
		 * The amount of blur applied to the rendered content in the horizontal.
		 */
		public function get blurX():Number
		{
			return _blurX;
		}

		public function set blurX(value:Number):void
		{
			_blurX = value;
		}

		public function get blurY():Number
		{
			return _blurY;
		}

		/**
		 * The amount of blur applied to the rendered content in the vertical.
		 */
		public function set blurY(value:Number):void
		{
			_blurY = value;
		}
		
		public function BlurFilter()
		{
		}
	}
}