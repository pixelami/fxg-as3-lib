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
	import org.pixelami.fxg.utils.SchemaTypeRegistry;
	import flash.filters.DropShadowFilter;

	public class DropShadowFilter extends FXGFilter
	{
		private var _distance:Number = 4;
		private var _angle:Number = 45;
		private var _color:uint = 0;
		private var _alpha:Number = 1; 
		private var _blurX:uint = 4;
		private var _blurY:uint = 4;
		private var _strength:Number = 1;
		private var _inner:Boolean = false;
		private var _knockout:Boolean = false;
		private var _hideObject:Boolean = false;
		
		/**
		 * The distance between each pixel in the source and its corresponding shadow in the output.
		 */
		public function get distance():Number
		{
			return _distance;
		}

		public function set distance(value:Number):void
		{
			_distance = value;
		}

		/**
		 * The angle of the generated drop shadow. This angle is expressed in document coordinate space.
		 */
		public function get angle():Number
		{
			return _angle;
		}

		public function set angle(value:Number):void
		{
			_angle = value;
		}

		/**
		 * The color of the rendered drop shadow.
		 */
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

		/**
		 * The amount of blur applied to the rendered content in the horizontal.
		 */
		public function get blurX():uint
		{
			return _blurX;
		}

		public function set blurX(value:uint):void
		{
			_blurX = value;
		}

		/**
		 * The amount of blur applied to the rendered content in the horizontal.
		 */
		public function get blurY():uint
		{
			return _blurY;
		}

		public function set blurY(value:uint):void
		{
			_blurY = value;
		}

		/**
		 * The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the shadow and the background. Valid values are from 0 to 255.0. The default is 1.0.
		 */
		public function get strength():Number
		{
			return _strength;
		}

		public function set strength(value:Number):void
		{
			_strength = value;
		}

		/**
		 * If true, drop shadow values are rendered above the original source content, and masked by the original content. If false, it is rendered below the original content.
		 */
		public function get inner():Boolean
		{
			return _inner;
		}

		public function set inner(value:Boolean):void
		{
			_inner = value;
		}

		/**
		 * Renders the effect only where the value in the original content was 100% transparent. All other pixels are 100% transparent.
		 */
		public function get knockout():Boolean
		{
			return _knockout;
		}

		public function set knockout(value:Boolean):void
		{
			_knockout = value;
		}

		/**
		 * If true, the original content is not copied into the final output.
		 */
		public function get hideObject():Boolean
		{
			return _hideObject;
		}

		public function set hideObject(value:Boolean):void
		{
			_hideObject = value;
		}

		
		public function DropShadowFilter()
		{
		}
		
		override public function getFilter():*
		{
			var f:flash.filters.DropShadowFilter = new flash.filters.DropShadowFilter(distance,angle,color,alpha,blurX,blurY,strength,quality,inner,knockout,hideObject)
			return f;
		}
	}
}