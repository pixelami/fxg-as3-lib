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
	import flash.filters.DropShadowFilter;
	
	import org.pixelami.fxg.utils.SchemaTypeRegistry;

	public class DropShadowFilter extends StandardFilterBase
	{
		private var _color:uint = 0;
		private var _alpha:Number = 1; 
		private var _inner:Boolean = false;
		private var _hideObject:Boolean = false;
		
		/**
		 * The distance between each pixel in the source and its corresponding shadow in the output.
		 */

		override public function set distance(value:Number):void
		{
			super.distance = value;
		}
		
		/**
		 * The angle of the generated drop shadow. This angle is expressed in document coordinate space.
		 */

		override public function set angle(value:Number):void
		{
			super.angle = value;
		}
		
		/**
		 * The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the shadow and the background. Valid values are from 0 to 255.0. The default is 1.0.
		 */
		override public function set strength(value:Number):void
		{
			super.strength = value;
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
		
		override public function getFilter():*
		{
			var f:flash.filters.DropShadowFilter = new flash.filters.DropShadowFilter(distance,angle,color,alpha,blurX,blurY,strength,quality,inner,knockout,hideObject)
			return f;
		}
	}
}