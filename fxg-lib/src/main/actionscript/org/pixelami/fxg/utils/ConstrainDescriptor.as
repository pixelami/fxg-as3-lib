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

package org.pixelami.fxg.utils
{
	public class ConstrainDescriptor
	{
		public var width:Number;
		public var height:Number;
		public var scaleX:Number;
		public var scaleY:Number;
		[Deprecated(message="replace with scaleX or scaleY",replacement="scaleX or scaleY",since="0.0.2")]
		public var factor:Number
		
		public function ConstrainDescriptor()
		{
		}
	}
}