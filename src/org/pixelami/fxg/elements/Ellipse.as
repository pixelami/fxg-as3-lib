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
	
	public class Ellipse extends FXGShapeElement
	{
		public function Ellipse()
		{
			super();
		}
		
		override protected function renderFill() : void
		{
			var g:Graphics = fillShape.graphics;
			
			if(fill)
			{
				fill.beginFill(g);
				g.drawEllipse(0,0,width,height);
				fill.endFill(g);
			}
		}
		
		override protected function renderStroke() : void
		{
			var g:Graphics = strokeShape.graphics;
			if(stroke)
			{
				stroke.doStroke(g);
				g.drawEllipse(0,0,width,height);
			}
		}
	}
}