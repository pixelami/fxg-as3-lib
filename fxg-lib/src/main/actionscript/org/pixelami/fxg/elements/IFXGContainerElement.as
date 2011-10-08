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
	public interface IFXGContainerElement
	{
		function set children(value:Vector.<IFXGElement>):void;
		function get children():Vector.<IFXGElement>;
	}
}