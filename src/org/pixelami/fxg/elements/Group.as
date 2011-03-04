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

/*
Children

* transform
* filters
* Group
* Any graphical element

Attributes

* rotation
* scaleX
* scaleY
* x
* y
* blendMode
* alpha
* id
* transformX
* transformY
* maskType
* visible
* scaleGridLeft
* scaleGridRight
* scaleGridTop
* scaleGridBottom

*/
package org.pixelami.fxg.elements
{
	
	[DefaultProperty("children")]
	public class Group extends FXGPlacedElement implements IFXGContainerElement
	{
		public function Group()
		{
			super();
		}
		
		private var _children:Vector.<IFXGElement>;
		
		
		//Attributes
		private var _scaleGridLeft:Number;
		private var _scaleGridRight:Number;
		private var _scaleGridTop:Number;
		private var _scaleGridBottom:Number;
		
		
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
		
		
		override protected function createChildren():void
		{
			for each(var child:IFXGElement in children)
			{
				trace("addingChild "+child);
				if(child is FXGDisplayElement)
				{
					addChild(FXGDisplayElement(child));
				}
			}
		}
		
	}
}