////////////////////////////////////////////////////////////////////////////////
//
//  pixelami.com
//  Copyright 2011 Original Authors (Alexander Syed et al)
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package org.pixelami.fxg.elements
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	import org.pixelami.fxg.utils.FXGUtil;
	import org.pixelami.fxg.utils.LayoutUtils;
	
	
	public class BitmapGraphic extends FXGDisplayElement
	{
		public function BitmapGraphic()
		{
			super();
		}
		
		private var _repeat:Boolean = true;
		private var _source:String;
		private var _width:Number;
		private var _height:Number;
		
		
		private var loader:Loader;
		private var bitmap:Bitmap;
		
		private var sourceSet:Boolean = true;
		private var bitmapReady:Boolean;

		public function set source(value:String):void
		{
			if(_source != value)
			{
				//_source = value;
				_source = extractEmbedURL(value);
				sourceSet = true;
				invalidateDisplayList();
			}
			
		}
		
		/**
		 * An embedded reference to the file defining the image data to render. Must be a PNG, JPG, or GIF file.  Required attribute.
		 */
		public function get source():String
		{
			return _source;
		}
		
		/**
		 * Whether the image data should be tiled to fill the image rectangle, if necessary. Defaults to true.
		 */
		public function get repeat():Boolean
		{
			return _repeat;
		}

		public function set repeat(value:Boolean):void
		{
			_repeat = value;
		}
		
		/**
		 * The width of the image rectangle, in the parent coordinate system. Defaults to the width of the source image data.
		 */
		override public function get width():Number
		{
			return _width;
		}
		
		override public function set width(value:Number):void
		{
			_width = value;
		}
		
		/**
		 * The height of the image rectangle, in the parent coordinate system. Defaults to the height of the source image data.
		 */
		override public function get height():Number
		{
			return _height;
		}
		
		override public function set height(value:Number):void
		{
			_height = value;
		}

		
		override protected function updateDisplayList(unscaledWidth:Number=NaN, unscaledHeight:Number=NaN):void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			renderElement();
		}
		
		public function renderElement():void
		{
			if(sourceSet)
			{
				sourceSet = false;
				if(!loader) loader = new Loader();
				loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
				loader.load(new URLRequest(source));
			}
			if(bitmapReady)
			{
				// bitmap loaded so do measure and layout
				trace("contentWidth: "+bitmap.width);
				trace("contentHeight: "+bitmap.height);
				
				var w:Number = width;
				var h:Number = height;
				
				// how's this for idiosynchratic ?
				w = w ? w : 0;
				h = h ? h : 0;
				
				if(bitmap.height != h || bitmap.width != w)
				{
					var constraint:Object = LayoutUtils.constrain(bitmap,{width:w,height:h},true);
					
					bitmap.width = constraint.width;
					bitmap.height = constraint.height;
					
					trace("post constrain width: "+bitmap.width);
					trace("post constrain  height: "+bitmap.height);
					
					bitmap.smoothing = true;
				}
				
			}
			if(bitmap)
			{
				//trace("has bitmap");
			}
		}
		
		
		private function onLoaderComplete(evt:Event):void
		{
			trace(evt.target.content);
			bitmap = evt.target.content;
			addChild(bitmap);
			bitmapReady = true;
			renderElement();
		}
		
		// TODO move to utils class
		protected function extractEmbedURL(source:String):String
		{
			return FXGUtil.extractEmbedURL(source);
		}
	}
}