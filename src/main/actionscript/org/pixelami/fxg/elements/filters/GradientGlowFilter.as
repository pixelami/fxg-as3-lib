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

package org.pixelami.fxg.elements.filters
{
	import flash.filters.GradientGlowFilter;
	
	import org.pixelami.fxg.elements.fills.GradientEntry;
	import org.pixelami.fxg.utils.FXGUtil;

	/**
	 * <p>Applies a Glow effect to the input element, using a specified gradient to fill the glow rather than a single color.
	 * <p>The gradient used in a GradientGlow is specified using child GradientEntry elements. See the section on gradient fills for more details.	 
	 */
	
	[DefaultProperty("entries")]
	public class GradientGlowFilter extends FXGStandardFilterBase
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
			var f:flash.filters.GradientGlowFilter = new flash.filters.GradientGlowFilter(
				distance,angle,o.colors,o.alphas,o.ratios,blurX,blurY,strength,quality,type,knockout);
		}
	}
}