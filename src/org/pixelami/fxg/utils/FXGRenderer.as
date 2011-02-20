////////////////////////////////////////////////////////////////////////////////
//
//  Pixelami
//  Copyright 2011 Original Authors (Alexander Syed et al)
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package org.pixelami.fxg.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import org.pixelami.fxg.utils.FXGRenderer;
	import org.pixelami.fxg.elements.BitmapGraphic;
	import org.pixelami.fxg.elements.Ellipse;
	import org.pixelami.fxg.elements.FXGElement;
	import org.pixelami.fxg.elements.Graphic;
	import org.pixelami.fxg.elements.Group;
	import org.pixelami.fxg.elements.IContentContainerElement;
	import org.pixelami.fxg.elements.IFXGContainerElement;
	import org.pixelami.fxg.elements.IFXGDisplayElement;
	import org.pixelami.fxg.elements.IFXGElement;
	import org.pixelami.fxg.elements.IFXGFilterable;
	import org.pixelami.fxg.elements.IFXGPaintable;
	import org.pixelami.fxg.elements.IFXGPlacedElement;
	import org.pixelami.fxg.elements.Line;
	import org.pixelami.fxg.elements.Path;
	import org.pixelami.fxg.elements.Rect;
	import org.pixelami.fxg.elements.TextGraphic;
	import org.pixelami.fxg.elements.fills.IFXGFill;
	import org.pixelami.fxg.elements.fills.LinearGradient;
	import org.pixelami.fxg.elements.fills.SolidColor;
	import org.pixelami.fxg.elements.filters.DropShadowFilter;
	import org.pixelami.fxg.elements.filters.IFXGFilter;
	import org.pixelami.fxg.elements.strokes.IFXGStroke;
	import org.pixelami.fxg.elements.strokes.SolidColorStroke;
	import org.pixelami.fxg.utils.XMLPropertyUtil;

	public class FXGRenderer
	{
		
		private var _fxg:XML;
		
		public function set fxg(value:XML):void
		{
			_fxg = value;
		}
		
		public function get fxg():XML
		{
			return _fxg;
		}
		
		public var graphic:Sprite;
		
		public var documentNS:Namespace;
		
		public function FXGRenderer(namespaceURI:String='http://ns.adobe.com/fxg/2008')
		{
			documentNS = new Namespace(null,namespaceURI);
			regsisterElements(namespaceURI);
		}
		
		
		protected function regsisterElements(ns:String):void
		{
			FXGElement.NAMESPACE = ns;
			
			// Visual elements
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"Graphic"),Graphic);
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"Group"),Group);
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"Line"),Line);
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"Path"),Path);
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"Ellipse"),Ellipse);
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"Rect"),Rect);
			
			// Fills
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"LinearGradient"),LinearGradient);
			//SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"RadialGradient"),RadialGradient);
			//SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"BitmapFill"),BitmapFill);
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"SolidColor"),SolidColor);
			
			
			// Strokes
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"SolidColorStroke"),SolidColorStroke);
			//SchemaTypeRegistry.getInstance().registerClass(new QName('http://ns.adobe.com/fxg/2008',"LinearGradientStroke"),LinearGradientStroke);
			//SchemaTypeRegistry.getInstance().registerClass(new QName('http://ns.adobe.com/fxg/2008',"RadialGradientStroke"),RadialGradientStroke);
			
			// Filters
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"DropShadowFilter"),DropShadowFilter);
			//SchemaTypeRegistry.getInstance().registerClass(new QName('http://ns.adobe.com/fxg/2008',"BlurFilter"),FXGBlurFilter);
			//SchemaTypeRegistry.getInstance().registerClass(new QName('http://ns.adobe.com/fxg/2008',"BevelFilter"),FXGBevelFilter);
			//SchemaTypeRegistry.getInstance().registerClass(new QName('http://ns.adobe.com/fxg/2008',"ColorMatrixFilter"),FXGColorMatrixFilter);
			//SchemaTypeRegistry.getInstance().registerClass(new QName('http://ns.adobe.com/fxg/2008',"GradientBevelFilter"),FXGGradientBevelFilter);
			//SchemaTypeRegistry.getInstance().registerClass(new QName('http://ns.adobe.com/fxg/2008',"GradientGlowFilter"),FXGGradientGlowFilter);
			
			// Text
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"TextGraphic"),TextGraphic);
			
			//Bitmap
			SchemaTypeRegistry.getInstance().registerClass(new QName(ns,"BitmapGraphic"),BitmapGraphic);
		}
		
		
		public function renderElement(element:XML,parent:Sprite=null):void
		{
			// TODO
			// clear any previous contents of parent
			
			if(!element) return;
			
			var elementClass:Class = SchemaTypeRegistry.getInstance().getClass(element.name());
			
			trace(element.name(), elementClass);
			var elementInstance:IFXGElement;
			
			
			// did the xml element resolve to a registered class ?
			if(elementClass)
			{
				
				//trace("elementClass: "+elementClass);
				elementInstance = new elementClass();
				
				if(elementInstance is IFXGElement)
				{
					mapProperties(element,elementInstance);
				}
				
				// this is designed to help us keep a reference to the Graphic (root) element of the FXG document
				if(elementInstance is Graphic)
				{
					//trace("Graphic: "+elementInstance);
					graphic = elementInstance as Sprite;
				}
				
				//&& parent is DisplayObjectContainer
				// are we a displayElement - i.e do we need to be added to a parent displayObject ?
				if(elementInstance is IFXGDisplayElement)
				{
					trace("adding child");
					parent.addChild(elementInstance as DisplayObject);
				}
				
				if(elementInstance is IFXGFill && parent is IFXGPaintable)
				{
					IFXGPaintable(parent).fill = elementInstance as IFXGFill;
				}
				
				if(elementInstance is IFXGStroke && parent is IFXGPaintable)
				{
					IFXGPaintable(parent).stroke = elementInstance as IFXGStroke;
				}
				
				if(elementInstance is IFXGFilter && parent is IFXGFilterable)
				{
					trace("parent",parent);
					var filters:Array = IFXGFilterable(parent).filters.slice();
					filters.push(elementInstance as IFXGFilter);
					IFXGFilterable(parent).filters = filters;
				}
				
				// cludgey implementation of setting a <content> value to a component implementing IContentContainerElement (TextGraphic)
				// it needs to drill down and get the value of the <content> child element and then assign it to the component instance.
				if(elementInstance is IContentContainerElement)
				{
					IContentContainerElement(elementInstance).content = element.documentNS::content.valueOf();
				}
				
			}
			
			// no element instance was created - we assume that we hit some node that does not map directly to an
			// FXGDispalyElement - which means it might be a property of an FXGDisplayElement e.g.
			// <fill> or <stroke> or <filers> etc.
			// in that case we want to recurse but we want to make sure that the current elementInstace is pointed
			// back to our parent instead of being left null.
			if(!elementInstance)
			{
				elementInstance = parent as IFXGElement;
			}
			
			
			// do we have children - then recurse - use current element as parent for any child display elements
			if(element.children())
			{
				for each(var e:XML in element.children())
				{
					//trace( e.toXMLString());
					renderElement(e,elementInstance as Sprite);
				}
			}
		}
		
		public function mapProperties(element:XML,object:Object):Object
		{
			return XMLPropertyUtil.mapProperties(element,object);
		}
	}
}