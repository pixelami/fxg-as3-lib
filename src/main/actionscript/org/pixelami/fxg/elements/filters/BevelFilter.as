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
	import flash.filters.BevelFilter;

	public class BevelFilter extends StandardFilterBase
	{
		private var _highlightAlpha:Number = 0.5;
		private var _highlightColor:uint = 0xFFFFFF;
		private var _shadowAlpha:Number = .5;
		private var _shadowColor:Number = 0;
		private var _type:String = "inner";
		
		
		/**
		 * The angle of the generated bevel. This angle is expressed in document coordinate space.
		 */
		override public function set angle(value:Number):void
		{
			super.angle = value;
		}
		
		/**
		 * The transparency of the generated highlight color.
		 */

		public function get highlightAlpha():Number
		{
			return _highlightAlpha;
		}

		public function set highlightAlpha(value:Number):void
		{
			_highlightAlpha = value;
		}
		
		/**
		 * The color of the generated highlight color.
		 */

		public function get highlightColor():uint
		{
			return _highlightColor;
		}

		public function set highlightColor(value:uint):void
		{
			_highlightColor = value;
		}
		
		/**
		 * The height of the bevel.
		 */
		override public function set distance(value:Number):void
		{
			super.distance = value;
		}
		
		/**
		 * The transparency of the generated shadow of the bevel.
		 */

		public function get shadowAlpha():Number
		{
			return _shadowAlpha;
		}

		public function set shadowAlpha(value:Number):void
		{
			_shadowAlpha = value;
		}
		
		/**
		 * The color of the generated shadow of the bevel.
		 */

		public function get shadowColor():Number
		{
			return _shadowColor;
		}

		public function set shadowColor(value:Number):void
		{
			_shadowColor = value;
		}
		
		/**
		 * The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the bevel and the background. Valid values are from 0 to 255.0. The default is 1.0.
		 */
		
		override public function set strength(value:Number):void
		{
			super.strength = value;
		}
		
		/**
		 * (inner, outer, full): The placement of the bevel on the object. Defaults to "inner".
		 */

		override public function set type(value:String):void
		{
			super.type = value;
		}
		
		override public function getFilter():*
		{
			var f:flash.filters.BevelFilter = new flash.filters.BevelFilter(
				distance,angle,highlightColor,highlightAlpha,shadowColor,shadowAlpha,blurX,blurY,strength,quality,type,knockout);
			return f;
		}
	}
}