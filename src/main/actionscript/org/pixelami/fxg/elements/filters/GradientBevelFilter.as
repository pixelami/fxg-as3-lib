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



/*
Children

* GradientEntry
*/
package org.pixelami.fxg.elements.filters
{
	import flash.filters.GradientBevelFilter;
	
	import org.pixelami.fxg.elements.fills.GradientEntry;
	import org.pixelami.fxg.elements.fills.IFXGFill;
	import org.pixelami.fxg.utils.FXGUtil;

	/**
	 * <p>Applies a Bevel effect to the input element, using a specified gradient to fill the bevel rather than a highlight and shadow color.
	 * <p>The gradient used in a GradientBevel is specified using child GradientEntry elements. See the section on gradient fills for more details. 
	 */
	
	[DefaultProperty("entries")]
	public class GradientBevelFilter extends FXGStandardFilterBase
	{
		
		private var _entries:Vector.<GradientEntry>;
		
		public function get entries():Vector.<GradientEntry>
		{
			return _entries;
		}
		
		public function set entries(value:Vector.<GradientEntry>):void
		{
			_entries = value;
		}
		
		override public function getFilter():*
		{
			var o:Object = FXGUtil.getColorsAlphasRatiosFromGradientEntries(entries);
			
			var f:flash.filters.GradientBevelFilter = new flash.filters.GradientBevelFilter(
				distance,angle,o.colors,o.alphas,o.ratios,blurX,blurY,strength,quality,type,knockout);
		}
	}
}