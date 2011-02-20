/*
RadialGradient

The RadialGradient element fills a path or shape with a continuously smooth color transition between a list of colors along the radius of a circle.

The circle used is the circle bounded by the box stretching from (-0.5, -0.5) to (0.5,0.5). Like LinearGradient, it is transformed by the matrix transform defined on the gradient.

RadialGradient supports all the same transform attributes and child elements that LinearGradient does. Additionally, because its rendering is defined by a box and not just a horizontal vector, it supports a scaleY attribute that is used along with scaleX to scale the bounding box before the other transform attributes are applied.

RadialGradient elements also define the attribute focalPointRatio. This defines where along the horizontal axis (of the untransformed box) the focal point of the radial gradient lies. A value of 1 places it at the right hand edge of the box (at 0.5,0). A value of -1 places it at the left hand edge of the box (at -0.5,0).

RadialGradient elements use child GradientEntry elements the same way LinearGradient elements do.
Children

* GradientEntry
* matrix

Attributes

* x <Number>: The horizontal translation of the gradient transform that defines the horizontal center of the gradient.
* y <Number>: The vertical translation of the gradient transform that defines the vertical center of the gradient.
* scaleX <Number>: The horizontal scale of the gradient transform that defines the width of the (unrotated) gradient.
* scaleY <Number>: The vertical scale of the gradient transform that defines the width of the (unrotated) gradient.
* rotation <Number> (<angle>): The rotation of the gradient transform.
* spreadMethod <String> (pad, reflect, repeat): How to choose the fill of pixels outside the gradient vector.
* interpolationMethod <String> (rgb, linearRGB): How to interpolate between entries of the gradient.
* focalPointRatio <Number>: The placement of the focal point of the radial gradient along the horizontal center axis of the gradient bounding box. A value of 1 lies against the right edge of the box; a value of -1 lies against the left edge. The default value of 0 places it in the middle of the box.

*/
package org.pixelami.fxg.elements.fills
{
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.geom.Matrix;

	public class RadialGradient extends FXGFill
	{
		private var _entries:Array;
		private var _spreadMethod:String = "pad";
		private var _interpolationMethod:String = "rgb";
		private var _focalPointRatio:Number = 0;
		
		protected var colors:Array;
		protected var alphas:Array;
		protected var ratios:Array;
		protected var matrix:Matrix;
		
		
		public function set entries(value:Array):void
		{
			_entries = value;
		}
		
		public function get entries():Array
		{
			return _entries;
		}
		
		
		public function RadialGradient()
		{
			super();
		}
		
		override public function set element(value:XML):void
		{
			super.element = value;
			/*
			var gradientEntries:XMLList = value.children();
			trace("RadialGradient entries: "+gradientEntries.toXMLString());
			
			colors = [];
			alphas = [];
			ratios = [];
			
			//var count:uint = 0;
			for each(var el:XML in gradientEntries)
			{
				var col:uint = FXGUtil.colorHexStringToInt(el.@color);
				colors.push(col);
				//trace("el.@alpha: "+el.@alpha);
				var alph:Number =  FXGUtil.getAlpha(el.@alpha,1) ;
				alphas.push(alph);
				var defaultRatio:Number = 
				var rat:Number = FXGUtil.getNumber(el.@ratio, ratios.length * (1/(gradientEntries.length() - 1)));
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
			
			var tx:Number = FXGUtil.getNumber(element.@x);
			var ty:Number = FXGUtil.getNumber(element.@y);
			var sx:Number = FXGUtil.getNumber(element.@scaleX);
			var sy:Number = FXGUtil.getNumber(element.@scaleY);;
			
			//matrix.translate(dx,dy);
			//matrix.scale(sx,sy);
			
			matrix.createGradientBox(sx,sy,radians,tx,ty);
			*/
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
				var rat:Number = (ge.ratio == NaN) ? count * (1/(entries.length - 1)) : ge.ratio;
				// flash internal ratios are between 0-255
				var rtio:uint = rat * 255;
				ratios.push(rtio);
			}
			
			trace("colors: "+colors);
			trace("alphas: "+alphas);
			trace("ratios: "+ratios);
			
			matrix = new Matrix();
		}
		
		
		override public function beginFill(value:Graphics):void
		{
			trace("LinearGradient beginFill");
			trace("colors: "+colors);
			trace("alphas: "+alphas);
			trace("ratios: "+ratios);
			//matrix = null
			trace("matrix: "+matrix);
			//value.beginGradientFill(GradientType.LINEAR,colors,alphas,ratios,matrix,spreadMethod,interpolationMethod,focalPointRatio);
			value.beginGradientFill(GradientType.RADIAL,colors,alphas,ratios,matrix);//,spreadMethod,interpolationMethod,focalPointRatio);
			
			
		}
		
	}
}