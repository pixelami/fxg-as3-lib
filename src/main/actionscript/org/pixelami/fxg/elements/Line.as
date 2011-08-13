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

package org.pixelami.fxg.elements
{
	public class Line extends FXGShapeElement
	{
		private var _xFrom:Number = 0;
		private var _yFrom:Number = 0;
		private var _xTo:Number = 0;
		private var _yTo:Number = 0;
		
		/**
		 * The x-axis starting point of the line. Defaults to 0.
		 */
		public function get xFrom():Number
		{
			return _xFrom;
		}

		public function set xFrom(value:Number):void
		{
			x = _xFrom = value;
			invalidateDisplayList();
		}

		/**
		 * The y-axis starting point of the line. Defaults to 0.
		 */
		public function get yFrom():Number
		{
			return _yFrom;
		}

		public function set yFrom(value:Number):void
		{
			y = _yFrom = value;
			invalidateDisplayList();
		}

		/**
		 * The x-axis ending point of the line. Defaults to 0.
		 */
		public function get xTo():Number
		{
			return _xTo;
		}

		public function set xTo(value:Number):void
		{
			_xTo = value;
			invalidateDisplayList();
		}

		/**
		 * The y-axis ending point of the line. Defaults to 0.
		 */
		public function get yTo():Number
		{
			return _yTo;
		}

		public function set yTo(value:Number):void
		{
			_yTo = value;
			invalidateDisplayList();
		}
		
		
		public function Line()
		{
			super();
		}

		override protected function renderFill():void
		{
		}
		
		override protected function renderStroke():void
		{
			stroke.doStroke(strokeShape.graphics);
			strokeShape.graphics.moveTo(0,0);
			strokeShape.graphics.lineTo(_xTo - _xFrom,_yTo - _yFrom);
		}
	}
}