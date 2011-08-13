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
		
		//private var sourceChanged:Boolean = true;
		private var bitmapReady:Boolean;
		
		private var requiresResize:Boolean;

		public function set source(value:*):void
		{
			if(value is String)
			{
			
				if(_source != value)
				{
					_source = extractEmbedURL(value);
					//sourceChanged = true;
					load();
				}
			}
			else if(value is Object)
			{
				bitmap = new value();
				bitmap.smoothing = true;
				addChild(bitmap);
				bitmapReady = true;
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
			if(_width != value)
			{
				_width = value;
				requiresResize = true;
				invalidateDisplayList();
			}
			
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
			/*if(sourceChanged)
			{
				sourceChanged = false;
			}*/
			if(bitmapReady)
			{
				bitmapReady = false;
				// bitmap loaded so do measure and layout
				if(isNaN(width) && isNaN(height))
				{
					//just use bitmap width
					_width = bitmap.width;
					_height = bitmap.height;
				}
				else if(bitmap.height != _height || bitmap.width != _width)
				{
					requiresResize = true;
				}
				
			}
			if(bitmap && requiresResize)
			{
				requiresResize = false;
				resize();
			}
		}
		
		protected function resize():void
		{
			var constraint:Object = LayoutUtils.constrain(bitmap,{width:_width,height:_height},true);
			
			bitmap.width = constraint.width;
			bitmap.height = constraint.height;
		}
		
		protected function load():void
		{
			if(!loader) loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
			loader.load(new URLRequest(source));
		}
		
		private function onLoaderComplete(evt:Event):void
		{
			bitmap = evt.target.content;
			bitmap.smoothing = true;
			addChild(bitmap);
			bitmapReady = true;
			renderElement();
		}
		
		protected function extractEmbedURL(source:String):String
		{
			return FXGUtil.extractEmbedURL(source);
		}
	}
}