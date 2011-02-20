/*
*  
* angle <Number>: The angle of the generated drop shadow. This angle is expressed in document coordinate space.
* blurX <Number>: The amount of blur applied to the rendered content in the horizontal.
* blurY <Number>: The amount of blur applied to the rendered content in the horizontal.
* color <Color>: The color of the rendered drop shadow.
* distance <Number>: The distance between each pixel in the source and its corresponding shadow in the output.
* inner <Boolean>: If true, drop shadow values are rendered above the original source content, and masked by the original content. If false, it is rendered below the original content.
* hideObject <Boolean>: If true, the original content is not copied into the final output.
* knockout <Boolean>: Renders the effect only where the value in the original content was 100% transparent. All other pixels are 100% transparent.
* quality <Number>: The quality of the rendered effect.
* strength <Number>: The strength of the imprint or spread. The higher the value, the more color is imprinted and the stronger the contrast between the shadow and the background. Valid values are from 0 to 255.0. The default is 1.0.

*/
package org.pixelami.fxg.elements.filters
{
	import org.pixelami.fxg.utils.SchemaTypeRegistry;
	import flash.filters.DropShadowFilter;

	public class DropShadowFilter extends FXGFilter
	{
		public var distance:Number = 4;
		public var angle:Number = 45;
		public var color:uint = 0;
		public var alpha:Number = 1; 
		public var blurX:uint = 4;
		public var blurY:uint = 4;
		public var strength:Number = 1;
		public var quality:Number = 2;
		public var inner:Boolean = false;
		public var knockout:Boolean = false;
		public var hideObject:Boolean = false;
		
		public function DropShadowFilter()
		{
		}
		
		override public function getFilter():*
		{
			/*
			if(element.@distance != undefined) distance = element.@distance;
			if(element.@blurX != undefined) blurX = element.@blurX;
			if(element.@blurXY != undefined) blurY = element.@blurY;
			if(element.@alpha != undefined) alpha = element.@alpha;
			if(element.@quality != undefined) quality = element.@quality;
			*/
			var f:flash.filters.DropShadowFilter = new flash.filters.DropShadowFilter(distance,angle,color,alpha,blurX,blurY,strength,quality,inner,knockout,hideObject)
			return f;
		}
	}
}