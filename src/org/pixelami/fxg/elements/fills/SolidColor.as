////////////////////////////////////////////////////////////////////////////////
//
//  Pixelami
//  Copyright 2011 Original Authors (Alexander Syed et al)
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package org.pixelami.fxg.elements.fills
{
	import flash.display.Graphics;

	public class SolidColor extends FXGFill
	{
		
		public function SolidColor()
		{
		}
		
		override public function beginFill(value:Graphics):void
		{
			value.beginFill(color,alpha);
		}
	}
}