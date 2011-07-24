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
	public class StandardFilterBase extends BlurFilter
	{
		private var _angle:Number;
		private var _distance:Number;
		private var _knockout:Boolean;
		private var _strength:Number;
		private var _type:String;
		
		
		/**
		 * The angle of the generated bevel. This angle is expressed in document coordinate space.
		 */
		
		public function get angle():Number
		{
			return _angle;
		}

		public function set angle(value:Number):void
		{
			_angle = value;
		}

		public function get distance():Number
		{
			return _distance;
		}

		public function set distance(value:Number):void
		{
			_distance = value;
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

		public function get strength():Number
		{
			return _strength;
		}

		public function set strength(value:Number):void
		{
			_strength = value;
		}

		public function get type():String
		{
			return _type;
		}

		public function set type(value:String):void
		{
			_type = value;
		}

	}
}