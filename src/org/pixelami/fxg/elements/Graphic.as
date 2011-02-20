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

/*
Children

* Library
* Group
* Any graphical element

Attributes

* scaleGridLeft
* scaleGridRight
* scaleGridTop
* scaleGridBottom
* viewWidth
* viewHeight
* version
* mask
*/
package org.pixelami.fxg.elements
{
	
	[DefaultProperty("children")]
	public class Graphic extends FXGDisplayElement
	{
		public function Graphic()
		{
			super();
		}
		
		
		private var _scaleGridLeft:Number;
		private var _scaleGridRight:Number;
		private var _scaleGridTop:Number;
		private var _scaleGridBottom:Number;
		
		
		private var _viewWidth:Number;
		private var _viewHeight:Number;
		private var _version:Number;
		private var _mask:Object;
		
		
		// children 
		private var _library:Library;
		private var _children:Vector.<IFXGElement>;
		
		
		
		public function get scaleGridLeft():Number
		{
			return _scaleGridLeft;
		}

		public function set scaleGridLeft(value:Number):void
		{
			_scaleGridLeft = value;
		}

		public function get scaleGridRight():Number
		{
			return _scaleGridRight;
		}

		public function set scaleGridRight(value:Number):void
		{
			_scaleGridRight = value;
		}

		public function get scaleGridTop():Number
		{
			return _scaleGridTop;
		}

		public function set scaleGridTop(value:Number):void
		{
			_scaleGridTop = value;
		}

		public function get scaleGridBottom():Number
		{
			return _scaleGridBottom;
		}

		public function set scaleGridBottom(value:Number):void
		{
			_scaleGridBottom = value;
		}

		public function get viewWidth():Number
		{
			return _viewWidth;
		}

		public function set viewWidth(value:Number):void
		{
			_viewWidth = value;
		}

		public function get viewHeight():Number
		{
			return _viewHeight;
		}

		public function set viewHeight(value:Number):void
		{
			_viewHeight = value;
		}

		public function get version():Number
		{
			return _version;
		}

		public function set version(value:Number):void
		{
			_version = value;
		}
/*
		public function get mask():Object
		{
			return _mask;
		}

		public function set mask(value:Object):void
		{
			_mask = value;
		}
*/
		public function get library():Library
		{
			return _library;
		}

		public function set library(value:Library):void
		{
			_library = value;
		}

		public function get children():Vector.<IFXGElement>
		{
			return _children;
		}

		public function set children(value:Vector.<IFXGElement>):void
		{
			if(_children != value)
			{
				_children = value;
				createChildren();
			}
		}

		override protected function createChildren():void
		{
			for each(var child:IFXGElement in children)
			{
				if(child is FXGDisplayElement)
				{
					trace("adding child");
					addChild(child as FXGDisplayElement);
				}
			}
		}
	}
}