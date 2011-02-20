package org.pixelami.fxg.elements.fills
{
	import flash.display.Graphics;

	public class FXGFill implements IFXGFill
	{
		public static const GRADIENT_DIMENSION:Number = 1638.4;
		
		private var _alpha:Number = 1; // <Number>: A real number value ranging from 0 to 1 specifying the opacity of the fill, with 1 being opaque. Defaults to 1.
		private var _color:uint; // <Color>: An RGB value (in the form #rrggbb) that defines the single color value to fill the shape with. Defaults to #000000.
		
		public function FXGFill()
		{
		}
		
		public function get alpha():Number
		{
			return _alpha;
		}
		
		public function set alpha(value:Number):void
		{
			_alpha = value;
		}
		
		public function get color():uint
		{
			return _color;
		}
		
		public function set color(value:uint):void
		{
			_color = value;
		}
		
		
		public function beginFill(value:Graphics):void
		{
			
		}
		
		public function endFill(value:Graphics):void
		{
			value.endFill();
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