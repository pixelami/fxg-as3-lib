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

/*
Children

* matrix

Attributes

* x <Number>: The horizontal translation of the transform that defines the horizontal center of the gradient.
* y <Number>: The vertical translation of the transform that defines the vertical center of the gradient.
* scaleX <Number>: The horizontal scale of the transform that defines the width of the (unrotated) gradient.
* scaleY <Number>: The vertical scale of the transform that defines the width of the (unrotated) gradient.
* rotation <Number> (<angle>): The rotation of the transform.
* transformX <Number>: The horizontal point of origin for the scale and rotation portions of the transform.
* transformY <Number>: The vertical point of origin for the scale and rotation portions of the transform.
* source <embedded bitmap>: A reference to the file containing the image data to use as fill.
* repeat <Boolean>: Whether the image data should be rendered once, or tiled to fill an infinite plane.

*/
package org.pixelami.fxg.elements.fills
{
	public class BitmapFill extends FXGFill
	{
		private var _x:Number;
		private var _y:Number;
		private var _scaleX:Number;
		private var _scaleY:Number;
		private var _rotation:Number;
		private var _transformX:Number;
		private var _transformY:Number;
		private var _source:String;
		private var _repeat:Boolean;
		
		
		public function get x():Number
		{
			return _x;
		}

		public function set x(value:Number):void
		{
			_x = value;
		}

		public function get y():Number
		{
			return _y;
		}

		public function set y(value:Number):void
		{
			_y = value;
		}

		public function get scaleX():Number
		{
			return _scaleX;
		}

		public function set scaleX(value:Number):void
		{
			_scaleX = value;
		}

		public function get scaleY():Number
		{
			return _scaleY;
		}

		public function set scaleY(value:Number):void
		{
			_scaleY = value;
		}

		public function get rotation():Number
		{
			return _rotation;
		}

		public function set rotation(value:Number):void
		{
			_rotation = value;
		}

		public function get transformX():Number
		{
			return _transformX;
		}

		public function set transformX(value:Number):void
		{
			_transformX = value;
		}

		public function get transformY():Number
		{
			return _transformY;
		}

		public function set transformY(value:Number):void
		{
			_transformY = value;
		}

		public function get source():String
		{
			return _source;
		}

		public function set source(value:String):void
		{
			_source = value;
		}

		public function get repeat():Boolean
		{
			return _repeat;
		}

		public function set repeat(value:Boolean):void
		{
			_repeat = value;
		}

		
		
		public function BitmapFill()
		{
			super();
		}
	}
}