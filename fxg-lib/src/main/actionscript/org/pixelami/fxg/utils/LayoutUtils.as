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
		public static function constrain(source: Object ,constrainer: Object , allowGrow:Boolean = false): Object
		{
			var constr: Object = {};
			var wfactor: Number = constrainer.width/source.width;
			var hfactor: Number = constrainer.height/source.height;
			constr.width = source.width;
			constr.height = source.height;

			if((wfactor == hfactor) || (wfactor != 1 && wfactor < hfactor)){
				constr.height = source.height * wfactor;
				constr.width = source.width * wfactor;
				constr.factor = wfactor;
			}
			else if(hfactor != 1 && wfactor > hfactor){
				constr.height = source.height * hfactor;
				constr.width = source.width * hfactor;
				constr.factor = hfactor;
			}
			if(!allowGrow && (constr.width > source.width || constr.height > source.height)) return source;
			return constr;
		}
		
		
		public function LayoutUtils()
		{
		}
	}
}