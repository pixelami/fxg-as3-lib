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
	
	import org.pixelami.fxg.utils.FXGUtil;

	/**
	 * The SolidColorStroke element represents a stroke painted with a solid color, or a solid color with opacity. It is similar to the SolidColor fill type.
	 */
	public class SolidColorStroke implements IFXGStroke
	{
		private var _thickness:Number = 1;
		private var _weight:Number = 1;
		private var _color:uint;
		private var _alpha:Number = 1;
		private var _pixelHinting:Boolean;
		private var _scaleMode:String="normal";
		private var _caps:String = "none";
		private var _joints:String = "miter";
		private var _miterLimit:Number = 3;
		
		public function SolidColorStroke()
		{
		}
		
		/**
		 * Alternate accessor for <code>weight<code> The line weight, in pixels. Defaults to 1.
		 */
		public function get thickness():Number
		{
			return _weight;
		}

		public function set thickness(value:Number):void
		{
			_weight = value;
		}
		
		/**
		 * The line weight, in pixels. Defaults to 1.
		 */
		public function get weight():Number
		{
			return _weight;
		}
		
		public function set weight(value:Number):void
		{
			_weight = value;
		}
		
		/**
		 * An RGB value (in the form #rrggbb) that defines the single color value to stroke the shape with. Defaults to #000000.
		 */
		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
		}

		/**
		 * A real number value ranging from 0 to 1 specifying the opacity of the stroke, with 1 being opaque. Defaults to 1.
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
		 * Specifies whether to hint strokes to full pixels. This value affects both the position of anchors of a curve and the line stroke size itself. Defaults to false.
		 */
		public function get pixelHinting():Boolean
		{
			return _pixelHinting;
		}

		public function set pixelHinting(value:Boolean):void
		{
			_pixelHinting = value;
		}

		/**
		 * (normal, none, horizontal, vertical): A value that specifies which scale mode to use. Defaults to "normal".
		 */
		public function get scaleMode():String
		{
			return _scaleMode;
		}

		public function set scaleMode(value:String):void
		{
			_scaleMode = value;
		}

		/**
		 * (round, square, none): Specifies the type of caps at the end of lines.
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
		 * (round, miter, bevel): Specifies the type of joint appearance used at angles.
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
		 * Indicates the limit at which a miter is cut off. Valid values range from 0 to 255. Defaults to 0.
		 */
		public function get miterLimit():Number
		{
			return _miterLimit;
		}

		public function set miterLimit(value:Number):void
		{
			_miterLimit = value;
		}

		
		public function doStroke(value:Graphics):void
		{
			value.lineStyle(thickness,color,alpha,pixelHinting,scaleMode,caps,joints,miterLimit);
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