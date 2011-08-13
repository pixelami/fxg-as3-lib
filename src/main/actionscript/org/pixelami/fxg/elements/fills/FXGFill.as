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

package org.pixelami.fxg.elements.fills
{
	import flash.display.Graphics;
	import flash.geom.Rectangle;

	public class FXGFill implements IFXGFill
	{
		public static const GRADIENT_DIMENSION:Number = 1638.4;
		
		private var _alpha:Number = 1;
		private var _color:uint = 0x000000;
		
		internal var targetGraphics:Graphics;
		internal var targetBounds:Rectangle;
		
		public function FXGFill()
		{
		}
		
		/**
		 * A real number value ranging from 0 to 1 specifying the opacity of the fill, with 1 being opaque. Defaults to 1.
		 */
		public function get alpha():Number
		{
			return _alpha;
		}
		
		public function set alpha(value:Number):void
		{
			_alpha = value;
		}
		
		/**
		 * An RGB value (in the form #rrggbb) that defines the single color value to fill the shape with. Defaults to #000000.
		 */
		public function get color():uint
		{
			return _color;
		}
		
		public function set color(value:uint):void
		{
			_color = value;
		}
		
		
		public function beginFill(target:Graphics,bounds:Rectangle):void
		{
			
		}
		
		public function endFill(value:Graphics):void
		{
			value.endFill();
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