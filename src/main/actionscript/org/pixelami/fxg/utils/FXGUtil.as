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
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import mx.utils.ObjectUtil;
	
	import org.pixelami.fxg.elements.fills.GradientEntry;
	
	[ExcludeClass]
	public class FXGUtil
	{

		
		/**
		 * Helper method to get a color value from an XML document
		 * 
		 * @param value
		 * @return 
		 * 
		 */
		static public function colorHexStringToInt(value:String):uint
		{
			return uint("0x"+value.slice(1));
		}
		
		/**
		 * 
		 * @param value
		 * @param defautValue
		 * @return 
		 * 
		 */
		static public function getNumber(value:String,defautValue:Number=0):Number
		{
			return value == "" ? defautValue : Number(value);
		}
		
		/**
		 * Helper method to get an x or y value from an XML document
		 * 
		 * @param value
		 * @param defautValue
		 * @return 
		 * 
		 */
		static public function getCoordinate(value:String,defautValue:Number=0):Number
		{
			return value == "" ? defautValue : Number(value);
		}
		
		/**
		 * Helper method to get an alpha value from an XML document
		 * 
		 * @param value
		 * @param defautValue
		 * @return 
		 * 
		 */
		static public function getAlpha(value:String,defautValue:Number=1):Number
		{
			return value == "" ? defautValue : Number(value);
		}
		
		
		/**
		 * Helper method to get a font size from an XML document
		 * 
		 * @param value
		 * @param defautValue
		 * @return 
		 * 
		 */
		static public function getFontSize(value:String,defautValue:Number=12):Number
		{
			return value == "" ? defautValue : Number(value);
		}
		
		
		/**
		 * returns the bounds rectangle of any given vector data string - like used in SVG or FXG or Degrafa
		 * 
		 * @param data
		 * @return 
		 * 
		 */
		static public function calculatePathBounds(data:String):Rectangle
		{
			var minX:Number = Number.POSITIVE_INFINITY;
			var minY:Number = Number.POSITIVE_INFINITY;
			var maxX:Number = Number.NEGATIVE_INFINITY;
			var maxY:Number = Number.NEGATIVE_INFINITY;
			
			
			
			var xcount:Number = 0;
			//pattern to get all digits
			var re:RegExp = /(-?\d+\.?\d*)/;
			var m:Object = re.exec(data);
			var numbers:Array = [];
			var str:String;
			var index:int = 0;
			while(m)
			{
				numbers.push(m[1]);
				var v:Number = m[1];
				var mod:Number = numbers.length % 2;
				
				
				trace("mod: "+mod);
				if(mod == 0)
				{
					minX = v < minX ? v : minX;
					maxX = v > maxX ? v : maxX;
					xcount ++;
				}
				if(mod == 1)
				{
					minY = v < minY ? v : minY;
					maxY = v > maxY ? v : maxY;
				}
				
				index += (m.index + m[1].length);
				str = data.substring(index);
				m = re.exec(str);
			}
			var rect:Rectangle = new Rectangle();
			rect.left = minX;
			rect.right = maxX;
			rect.top = minY;
			rect.bottom = maxY;
			return rect;
		}
		
		private static function getPointsBounds(points:Vector.<Point>):Rectangle
		{
			var rect:Rectangle = new Rectangle();
			var minX:Number = Number.POSITIVE_INFINITY;
			var maxX:Number = Number.NEGATIVE_INFINITY;
			var minY:Number = Number.POSITIVE_INFINITY;
			var maxY:Number = Number.NEGATIVE_INFINITY;
			
			
			for each(var p:Point in points)
			{
				minX = p.x < minX ? p.x : minX;
				maxX = p.x > maxX ? p.x : maxX;
				minY = p.y < minY ? p.y : minY;
				maxY = p.y > maxY ? p.y : maxY;
			}
			
			rect.left = minX;
			rect.right = maxX;
			rect.top = minY;
			rect.bottom = maxY;
			
			return rect;
		}
		
		/** 
		 * @param source an emebedded url string
		 * @return the url from an emebedded url string
		 */
		public static function extractEmbedURL(source:String):String
		{
			// handle escaped strings
			var src:String = unescape(source);
			var p:RegExp = /^@Embed\('(.*[^\)])'\)/i;
			var m:Object = p.exec(source);
			if(m)
			{
				src = m[1];
			}
			
			// fix path for url
			if(source.indexOf("http:") != 0 && source.indexOf("file:") != 0)
			{
				source = "file://" +source;
			}
			
			return src;
		}
		
		public static function getColorsAlphasRatiosFromGradientEntries(entries:Vector.<GradientEntry>):Object
		{
			var o:Object = {};
			o.colors = [];
			o.alphas = [];
			o.ratios = [];
			
			var count:uint = 0;
			for each(var ge:GradientEntry in entries)
			{
				o.colors.push(ge.color);
				o.alphas.push(ge.alpha);
				var rat:Number = isNaN(ge.ratio) ? count * (1/(entries.length - 1)) : ge.ratio;
				// flash internal ratios are between 0-255
				var rtio:uint = rat * 255;
				o.ratios.push(rtio);
			}
			
			return o;
		}
		
	}
}