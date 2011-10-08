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
	public class LayoutUtils
	{
		public static function constrain(source: * ,constrainer: * , allowGrow:Boolean = false): ConstrainDescriptor
		{
			if(!Object(source).hasOwnProperty("height") || !Object(source).hasOwnProperty("width"))
			{
				throw new ArgumentError("source argument must contain a width and height property");
			}
			if(!Object(constrainer).hasOwnProperty("height") || !Object(constrainer).hasOwnProperty("width"))
			{
				throw new ArgumentError("constrainer argument must contain a width and height property");
			}
			
			var constr: ConstrainDescriptor = new ConstrainDescriptor();
			var wfactor: Number = constrainer.width/source.width;
			var hfactor: Number = constrainer.height/source.height;
			constr.width = source.width;
			constr.height = source.height;

			if((wfactor == hfactor) || (wfactor != 1 && wfactor < hfactor)){
				constr.height = source.height * wfactor;
				constr.width = source.width * wfactor;
				constr.factor = wfactor;
				constr.scaleX = wfactor;
			}
			else if(hfactor != 1 && wfactor > hfactor){
				constr.height = source.height * hfactor;
				constr.width = source.width * hfactor;
				constr.factor = hfactor;
				constr.scaleY = hfactor;
			}
			if(!allowGrow && (constr.width > source.width || constr.height > source.height)) return source;
			return constr;
		}
		
		
		public function LayoutUtils()
		{
		}
	}
}