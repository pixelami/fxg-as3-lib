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

package org.pixelami.fxg.elements
{
	import flash.display.Graphics;
	import flash.display.Shape;
	
	public class Rect extends FXGShapeElement
	{
		private var _radiusX:Number;
		private var _radiusY:Number;
		
		
		public function Rect()
		{
			super();
		}
		
		/**
		 * For rounded rectangles, the x-axis radius of the ellipse used to round off the corners of the rectangle. A negative value is an error. See the notes below about what happens if the attribute is not specified.
		 */
		public function get radiusX():Number
		{
			return _radiusX;
		}

		public function set radiusX(value:Number):void
		{
			_radiusX = value;
		}

		/**
		 * For rounded rectangles, the y-axis radius of the ellipse used to round off the corners of the rectangle. A negative value is an error See the notes below about what happens if the attribute is not specified.
		 */
		public function get radiusY():Number
		{
			return _radiusY;
		}

		public function set radiusY(value:Number):void
		{
			_radiusY = value;
		}
		
		
		override protected function renderFill() : void
		{
			var g:Graphics = fillShape.graphics;
			
			if(fill)
			{
				
				fill.beginFill(g);
				
				if(!radiusX) radiusX = 0;
				if(!radiusY) radiusY = 0;
				
				
				if((radiusX==0) && (radiusY==0))
				{
					fillShape.graphics.drawRect(0,0,width,height);
				}
				else
				{
					
					fillShape.graphics.drawRoundRect(0,0,width,height,radiusX,radiusY);
				}
				
				fill.endFill(g);
			}
			
		}
		
		override protected function renderStroke() : void
		{
			if(stroke)
			{
				stroke.doStroke(strokeShape.graphics);
				
				if(radiusX == 0 && radiusY == 0)
				{
					strokeShape.graphics.drawRect(0,0,width,height);
				}
				else
				{
					strokeShape.graphics.drawRoundRect(0,0,width,height,radiusX,radiusY);
				}
			}
		}
		
	}
}