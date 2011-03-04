////////////////////////////////////////////////////////////////////////////////
//
//  pixelami.com
//  Copyright 2011 Original Authors (Alexander Syed et al)
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package org.pixelami.fxg.elements.fills
{
	public class GradientEntry
	{
		private var _color:uint;
		
		private var _alpha:Number = 1;
		
		private  var _ratio:Number;
		
		
		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
		}

		public function get alpha():Number
		{
			return _alpha;
		}

		public function set alpha(value:Number):void
		{
			_alpha = value;
		}

		public function get ratio():Number
		{
			return _ratio;
		}

		public function set ratio(value:Number):void
		{
			_ratio = value;
		}

		
		public function GradientEntry()
		{
		}
	}
}