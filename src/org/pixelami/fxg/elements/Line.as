/**
 * Created by Alexander "Foo 'The Man' Choo" Syed (a.k.a. Captain Fantastic) 
 */

package org.pixelami.fxg.elements
{
	
	
	public class Line extends FXGShapeElement
	{
		private var _xFrom:Number = 0; //  <Number> The x-axis starting point of the line. Defaults to 0.
		private var _yFrom:Number = 0; //  <Number> The y-axis starting point of the line. Defaults to 0.
		private var _xTo:Number = 0; //  <Number> The x-axis ending point of the line. Defaults to 0.
		private var _yTo:Number = 0;  //  <Number> The y-axis ending point of the line. Defaults to 0.
		
		public function Line()
		{
			super();
		}
		
		public function get xFrom():Number
		{
			return _xFrom;
		}

		public function set xFrom(value:Number):void
		{
			_xFrom = value;
		}

		public function get yFrom():Number
		{
			return _yFrom;
		}

		public function set yFrom(value:Number):void
		{
			_yFrom = value;
		}

		public function get xTo():Number
		{
			return _xTo;
		}

		public function set xTo(value:Number):void
		{
			_xTo = value;
		}

		public function get yTo():Number
		{
			return _yTo;
		}

		public function set yTo(value:Number):void
		{
			_yTo = value;
		}

	}
}