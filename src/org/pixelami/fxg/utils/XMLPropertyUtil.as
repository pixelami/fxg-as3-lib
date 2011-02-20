package org.pixelami.fxg.utils
{
	
	
	public class XMLPropertyUtil
	{
		static public function getPercentage(value:String):Number
		{
			var n:Number;
			if(value.indexOf("%") == value.length-1)
			{
				n = Number(value.substring(0,value.length-1));
			}
			return n;
		}
		
		
		static public function mapProperties(xml:XML,object:Object):Object
		{
			var properties:XMLList = xml.attributes();
			for each(var property:XML in properties)
			{
				var name:String = property.name();
				var value:* = property.valueOf();
				
				if(value)
				{
					trace("value.charAt(0)",value.charAt(0))
					if(value.charAt(0) == "#")
					{
						value = colorHexStringToInt(property.valueOf());
					}
				}	
				
				trace(name , value);
				object[name] = value;
			}
			return object;
		}
		
		
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
		
		
	}
}