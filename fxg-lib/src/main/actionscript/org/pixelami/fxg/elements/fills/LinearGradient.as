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
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.InterpolationMethod;
	import flash.display.SpreadMethod;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	[DefaultProperty("entries")]
	public class LinearGradient extends FXGFill implements IFXGGradientFill
	{
		public static const GRADIENT_DIMENSION:Number = 1638.4;
		
		private var _entries:Vector.<GradientEntry> = new Vector.<GradientEntry>();
		
		private var _matrix:Matrix;
		private var _spreadMethod:String = SpreadMethod.PAD;
		private var _interpolationMethod:String = InterpolationMethod.RGB;
		private var _rotation:Number = 0.0;
		private var _scaleX:Number;
		private var _x:Number;
		private var _y:Number;
		
		protected var colors:Array;
		protected var alphas:Array;
		protected var ratios:Array;
		protected var focalPointRatio:Number = 0;
		protected var radians:Number;
		

		

		public function set entries(value:Vector.<GradientEntry>):void
		{
			_entries = value;
		}
		
		public function get entries():Vector.<GradientEntry>
		{
			return _entries;
		}
		
		
		public function get matrix():Matrix
		{
			return _matrix;
		}

		public function set matrix(value:Matrix):void
		{
			_matrix = value;
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
		 * The rotation of the gradient transform.
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

		
		
		override public function set element(value:XML):void
		{
			super.element = value;
			
			
		}
		
		protected function prepare():void
		{
			colors = [];
			alphas = [];
			ratios = [];
			
			var count:uint = 0;
			for each(var ge:GradientEntry in entries)
			{
				colors.push(ge.color);
				alphas.push(ge.alpha);
				var rat:Number = isNaN(ge.ratio) ? count * (1/(entries.length - 1)) : ge.ratio;
				// flash internal ratios are between 0-255
				var rtio:uint = rat * 255;
				ratios.push(rtio);
			}
			
			matrix = new Matrix();
		}
		
		internal function get rotationInRadians():Number
		{
			return rotation / 180 * Math.PI;
		}
		
		////////////////////////////////////////////////////////////////////////////////
		//
		//  ADOBE SYSTEMS INCORPORATED
		//  Copyright 2008 Adobe Systems Incorporated
		//  All Rights Reserved.
		//
		//  NOTICE: Adobe permits you to use, modify, and distribute this file
		//  in accordance with the terms of the license agreement accompanying it.
		//
		////////////////////////////////////////////////////////////////////////////////
		
		public function createMatrix(bounds:Rectangle):void
		{

			matrix = new Matrix();
			matrix.identity();

			
			var tx:Number = x;//!isNaN(x) ? x : bounds.width;
			var ty:Number = y;//!isNaN(y) ? y : bounds.height;
			var sx:Number = scaleX;
			var sy:Number;
			
			
			var length:Number = sx;
			
			
			if (isNaN(length))
			{
				// Figure out the two sides
				if (rotation % 90 != 0)
				{			
					// Normalize angles with absolute value > 360 
					var normalizedAngle:Number = rotation % 360;
					// Normalize negative angles
					if (normalizedAngle < 0)
						normalizedAngle += 360;
					
					// Angles wrap at 180
					normalizedAngle %= 180;
					
					// Angles > 90 get mirrored
					if (normalizedAngle > 90)
						normalizedAngle = 180 - normalizedAngle;
					
					var side:Number = bounds.width;
					// Get the hypotenuse of the largest triangle that can fit in the bounds
					var hypotenuse:Number = Math.sqrt(bounds.width * bounds.width + bounds.height * bounds.height);
					// Get the angle of that largest triangle
					var hypotenuseAngle:Number =  Math.acos(bounds.width / hypotenuse) * 180 / Math.PI;
					
					// If the angle is larger than the hypotenuse angle, then use the height 
					// as the adjacent side of the triangle
					if (normalizedAngle > hypotenuseAngle)
					{
						normalizedAngle = 90 - normalizedAngle;
						side = bounds.height;
					}
					
					// Solve for the hypotenuse given an adjacent side and an angle. 
					length = side / Math.cos(normalizedAngle / 180 * Math.PI);
				}
				else 
				{
					// Use either width or height based on the rotation
					length = (rotation % 180) == 0 ? bounds.width : bounds.height;
				}
			}
			
			// If only x or y is defined, force the other to be set to 0
			if (!isNaN(tx) && isNaN(ty))
				ty = 0;
			else if (isNaN(tx) && !isNaN(ty))
				tx = 0;
			
			// If x and y are specified, then move the gradient so that the
			// top left corner is at 0,0
			if (!isNaN(tx) && !isNaN(ty))
				matrix.translate(GRADIENT_DIMENSION / 2, GRADIENT_DIMENSION / 2); // 1638.4 / 2
			
			// Force the length to a absolute minimum of 2. Values of 0, 1, or -1 have undesired behavior	
			if (length >= 0 && length < 2)
				length = 2;
			else if (length < 0 && length > -2)
				length = -2;
			
			// Scale the gradient in the x direction. The natural size is 1638.4px. No need
			// to scale the y direction because it is infinite
			matrix.scale (length / GRADIENT_DIMENSION, 1 / GRADIENT_DIMENSION);
			
			matrix.rotate (rotationInRadians);
			
			if (isNaN(tx))
				tx = bounds.left + bounds.width / 2;
			else
				tx += 0;//targetOrigin.x;
			if (isNaN(ty))
				ty = bounds.top + bounds.height / 2;
			else
				ty += 0;//targetOrigin.y;
			
			matrix.translate(tx, ty);	
		}

		
		override public function beginFill(value:Graphics, bounds:Rectangle):void
		{
			prepare();
			createMatrix(bounds);
			trace("colors: "+colors);
			trace("alphas: "+alphas);
			trace("ratios: "+ratios);
			value.beginGradientFill(GradientType.LINEAR,colors,alphas,ratios,matrix,spreadMethod,interpolationMethod,focalPointRatio);
		}

	}
}