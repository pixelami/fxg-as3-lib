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
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Matrix;

	/**
	 * The ColorMatrixFilter class lets you apply a 4x5 matrix transformation on the RGBA color and alpha values of every pixel in the input image to produce a result with a new set of RGBA color and alpha values. It allows saturation changes, hue rotation, luminance to alpha, and various other effects.
	 */
	public class ColorMatrixFilter extends FXGFilter
	{
		private var _matrix:String;
		
		private var _matrixArray:Array;
		
		public function ColorMatrixFilter()
		{
			
		}
		
		/**
		 * A comma-delimited list of 20 doubles that comprise a 4x5 matrix applied to the rendered element.  The matrix is in row major order---that is, the first five elements are multiplied by the vector [srcR,srcG,srcB,srcA,1] to determine the output red value, the second five determine the output green value, etc.
		 */
		public function get matrix():String
		{
			return _matrix;
		}

		public function set matrix(value:String):void
		{
			_matrix = value;
		}

		
		public function ColorMatrixFilter()
		{
			super();
		}
		
		
		
		override public function getFilter():*
		{
			var m:Array = [];
			m = matrix.split(",");
			if(m.length != 20) 
			{
				throw new Error("ColorMatrixFilter requires a comma-delimited list of 20 doubles that comprise a 4x5 matrix applied to the rendered element ");
			}
			for(var row:uint = 0; row < 4; row++)
			{
				var arr:Array = [];
				for(var col:uint = 0; col < 5; col++)
				{
					arr.push(m.shift());
				}
				_matrixArray.push(arr);
			}
			var f:flash.filters.ColorMatrixFilter = new flash.filters.ColorMatrixFilter(_matrixArray);	
			return f;
		}
	}
}