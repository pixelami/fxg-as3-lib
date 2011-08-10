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

package org.pixelami.fxg.elements.fills
{
	import flash.display.Graphics;
	import flash.geom.Rectangle;

	public class SolidColor extends FXGFill
	{
		
		public function SolidColor()
		{
		}
		
		override public function beginFill(value:Graphics, bounds:Rectangle):void
		{
			value.beginFill(color,alpha);
		}
	}
}