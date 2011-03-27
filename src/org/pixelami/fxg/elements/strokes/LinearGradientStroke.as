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

package org.pixelami.fxg.elements.strokes
{
	import flash.display.Graphics;
	
	import org.pixelami.fxg.elements.fills.GradientEntry;

	[DefaultProperty("entries")]
	
	/**
	 * The LinearGradientStroke paints a stroke along a path or shape with a continuously smooth color transition between a list of colors along a vector. 
	 * The LinearGradientStroke operates almost identically to the LinearGradient fill type. As with the fill, By default, a LinearGradientStroke is transformed to fill the bounding box of the path being stroked. The bounding box is computed by computing the bounding box of the anchor points of the path, and expanding its borders outward in each direction by half the weight of the stroke.
	 * Otherwise its rendering behavior is identical to that of the LinearGradientFill.
	 */
	public class LinearGradientStroke  implements IFXGStroke
	{
		private var _x:Number;
		private var _y:Number;
		private var _scaleX:Number;
		private var _rotation:Number;
		private var _spreadMethod:String = "pad";
		private var _interpolationMethod:String = "rgb";
		private var _scalMode:String = "normal";
		private var _caps:String = "none";
		private var _joints:String = "round";
		private var _miterLimit:Number;
		
		// GradientEntry
		private var _entries:Vector.<GradientEntry>;
		private var matrix:Object;
		
		/**
		 * The horizontal translation of the gradient transform that defines the horizontal center of the gradient.
		 */
		public function get x():Number
		{
			return _x;
		}

		public function set x(value:Number):void
		{
			_x = value;
		}

		/**
		 * The vertical translation of the gradient transform that defines the vertical center of the gradient.
		 */
		public function get y():Number
		{
			return _y;
		}

		public function set y(value:Number):void
		{
			_y = value;
		}

		/**
		 * The horizontal scale of the gradient transform that defines the width of the (unrotated) gradient.
		 */
		public function get scaleX():Number
		{
			return _scaleX;
		}

		public function set scaleX(value:Number):void
		{
			_scaleX = value;
		}

		/**
		 * The rotation of the gradient transform. (radians)
		 */
		public function get rotation():Number
		{
			return _rotation;
		}

		public function set rotation(value:Number):void
		{
			_rotation = value;
		}

		/**
		 * (pad, reflect, repeat): How to choose the fill of pixels outside the gradient vector.
		 */
		public function get spreadMethod():String
		{
			return _spreadMethod;
		}

		public function set spreadMethod(value:String):void
		{
			_spreadMethod = value;
		}

		/**
		 * (rgb, linearRGB): How to interpolate between entries of the gradient.
		 */
		public function get interpolationMethod():String
		{
			return _interpolationMethod;
		}

		public function set interpolationMethod(value:String):void
		{
			_interpolationMethod = value;
		}

		/**
		 * (normal, none, vertical, horizontal): A value that specifies which scale mode to use. Defaults to "normal".
		 */
		public function get scalMode():String
		{
			return _scalMode;
		}

		public function set scalMode(value:String):void
		{
			_scalMode = value;
		}

		/**
		 * (none, round, square): A value that specifies the type of caps at the end of lines. Defaults to "none".
		 */
		public function get caps():String
		{
			return _caps;
		}

		public function set caps(value:String):void
		{
			_caps = value;
		}

		/**
		 * (bevel, miter, round): A value that specifies the type of joint appearance used at angles. Defaults to "round".
		 */
		public function get joints():String
		{
			return _joints;
		}

		public function set joints(value:String):void
		{
			_joints = value;
		}

		/**
		 * A number that indicates the limit at which a miter is cut off. Valid values range from 0 to 255.
		 */
		public function get miterLimit():Number
		{
			return _miterLimit;
		}

		public function set miterLimit(value:Number):void
		{
			_miterLimit = value;
		}
		
		
		
		public function get entries():Vector.<GradientEntry>
		{
			return _entries;
		}

		public function set entries(value:Vector.<GradientEntry>):void
		{
			_entries = value;
		}

		public function LinearGradientStroke()
		{
			super();
		}
				
		public function doStroke(value:Graphics):void
		{
			
		}
				

	}
}