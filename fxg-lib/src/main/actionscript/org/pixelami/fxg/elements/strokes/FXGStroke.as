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

	public class FXGStroke implements IFXGStroke
	{
		private var _thickness:Number = 1;
		private var _weight:Number = 1;
		private var _joints:String = "miter";
		private var _miterLimit:Number = 3;
		private var _pixelHinting:Boolean;
		
		/**
		 * Alternate accessor for <code>weight<code> The line weight, in pixels. Defaults to 1.
		 */
		public function get thickness():Number
		{
			return _thickness;
		}

		public function set thickness(value:Number):void
		{
			_thickness = value;
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

		
		public function FXGStroke()
		{
		}
		
		public function doStroke(value:Graphics):void
		{
			
		}
	}
}