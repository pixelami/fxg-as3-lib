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
	import flash.geom.Matrix;
	
	import org.pixelami.fxg.utils.FXGUtil;

	/**
	 * RadialGradient
	 * 
	 * <p>The RadialGradient element fills a path or shape with a continuously smooth color transition between a list of colors along the radius of a circle.
	 * <p>The circle used is the circle bounded by the box stretching from (-0.5, -0.5) to (0.5,0.5). Like LinearGradient, it is transformed by the matrix transform defined on the gradient.
	 * <p>RadialGradient supports all the same transform attributes and child elements that LinearGradient does. Additionally, because its rendering is defined by a box and not just a horizontal vector, it supports a scaleY attribute that is used along with scaleX to scale the bounding box before the other transform attributes are applied.
	 * <p>RadialGradient elements also define the attribute focalPointRatio. This defines where along the horizontal axis (of the untransformed box) the focal point of the radial gradient lies. A value of 1 places it at the right hand edge of the box (at 0.5,0). A value of -1 places it at the left hand edge of the box (at -0.5,0).
	 * 
	 * <p>RadialGradient elements use child GradientEntry elements the same way LinearGradient elements do.
	 */
	
	public class RadialGradient extends FXGFill
	{
		private var _entries:Array;
		private var _matrix:Matrix;
		
		private var _x:Number;
		private var _y:Number;
		private var _scaleX:Number;
		private var _scaleY:Number;
		private var _rotation:Number;
		private var _spreadMethod:String = "pad";
		private var _interpolationMethod:String = "rgb";
		private var _focalPointRatio:Number = 0;
		
		private var _colors:Array;
		private var _alphas:Array;
		private var _ratios:Array;
		
		
		public function set entries(value:Array):void
		{
			_entries = value;
		}
		
		public function get entries():Array
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
		 * The vertical scale of the gradient transform that defines the width of the (unrotated) gradient.
		 */
		public function get scaleY():Number
		{
			return _scaleY;
		}

		public function set scaleY(value:Number):void
		{
			_scaleY = value;
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
		 * The placement of the focal point of the radial gradient along the horizontal center axis of the gradient bounding box. A value of 1 lies against the right edge of the box; a value of -1 lies against the left edge. The default value of 0 places it in the middle of the box.
		 */
		public function get focalPointRatio():Number
		{
			return _focalPointRatio;
		}

		public function set focalPointRatio(value:Number):void
		{
			_focalPointRatio = value;
		}

		public function get colors():Array
		{
			return _colors;
		}

		public function set colors(value:Array):void
		{
			_colors = value;
		}

		public function get alphas():Array
		{
			return _alphas;
		}

		public function set alphas(value:Array):void
		{
			_alphas = value;
		}

		public function get ratios():Array
		{
			return _ratios;
		}

		public function set ratios(value:Array):void
		{
			_ratios = value;
		}

		
		
		public function RadialGradient()
		{
			super();
		}
		
		protected function prepare():void
		{
			
			colors = [];
			alphas = [];
			ratios = [];
			
			//var count:uint = 0;
			for each(var el:XML in entries)
			{
				var col:uint = FXGUtil.colorHexStringToInt(el.@color);
				colors.push(col);
				//trace("el.@alpha: "+el.@alpha);
				var alph:Number =  FXGUtil.getAlpha(el.@alpha,1) ;
				alphas.push(alph);
				//var defaultRatio:Number = 
				var rat:Number = FXGUtil.getNumber(el.@ratio, ratios.length * (1/(entries.length() - 1)));
				var rtio:uint = rat * 255;
				ratios.push(rtio);
			}
			
			trace("colors: "+colors);
			trace("alphas: "+alphas);
			trace("ratios: "+ratios);
			
			matrix = new Matrix();
			var rot:Number = FXGUtil.getNumber(element.@rotation);
			// check if angle is greater than 180 - if it is then subtract 360 - matrix for gradient fill only seems to take values between
			// PI and -PI
			trace ("rot pre: "+rot);
			if(rot > 180) rot = rot - 360;
			trace ("rot: "+rot);
			var radians:Number = (rot) * (Math.PI/180);
			trace("rads: "+radians);
			//matrix.rotate(radians);
			
			var tx:Number = _x;
			var ty:Number = _y;
			var sx:Number = _scaleX;
			var sy:Number = _scaleY;
			
			//matrix.translate(dx,dy);
			//matrix.scale(sx,sy);
			
			matrix.createGradientBox(sx,sy,radians,tx,ty);
			
		}
		
		
		override public function beginFill(value:Graphics):void
		{
			prepare();
			value.beginGradientFill(GradientType.RADIAL,colors,alphas,ratios,matrix,spreadMethod,interpolationMethod,focalPointRatio);
			
			
		}
		
	}
}