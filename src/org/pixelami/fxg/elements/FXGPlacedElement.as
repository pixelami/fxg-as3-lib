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

package org.pixelami.fxg.elements
{
	import org.pixelami.fxg.elements.filters.IFXGFilter;
	
	
	public class FXGPlacedElement extends FXGDisplayElement implements IFXGPlacedElement , IFXGFilterable
	{
		//private var _transform
		//private var _mask
		private var _filters:Array;
		
		
		private var _rotation:Number;
		private var _scaleX:Number;
		private var _scaleY:Number;
		private var _x:Number;
		private var _y:Number;
		private var _blendMode:String;
		private var _alpha:Number;
		private var _id:String;
		private var _transformX:Number;
		private var _transformY:Number;
		private var _maskType:String;
		private var _visible:Boolean = true;
		
		public function FXGPlacedElement()
		{
			super();
		}
		
		
		override public function get filters():Array
		{
			if(!_filters) _filters = [];
			return _filters;
		}

		override public function set filters(value:Array):void
		{
			if(_filters != value)
			{
				_filters = value;
				invalidateDisplayList();
			}
			
		}
/*
		override public function get rotation():Number
		{
			return _rotation;
		}

		override public function set rotation(value:Number):void
		{
			_rotation = value;
		}

		override public function get scaleX():Number
		{
			return _scaleX;
		}

		override public function set scaleX(value:Number):void
		{
			_scaleX = value;
		}

		override public function get scaleY():Number
		{
			return _scaleY;
		}

		override public function set scaleY(value:Number):void
		{
			_scaleY = value;
		}
		*/
		override public function get x():Number
		{
			return _x;
		}

		override public function set x(value:Number):void
		{
			_x = value;
			super.x = _x;
		}

		override public function get y():Number
		{
			return _y;
		}

		override public function set y(value:Number):void
		{
			_y = value;
			super.y = y;
		}
		/*
		override public function get blendMode():String
		{
			return _blendMode;
		}

		override public function set blendMode(value:String):void
		{
			_blendMode = value;
		}

		override public function get alpha():Number
		{
			return _alpha;
		}

		override public function set alpha(value:Number):void
		{
			_alpha = value;
		}
		*/

		public function get id():String
		{
			return _id;
		}

		public function set id(value:String):void
		{
			_id = value;
		}

		public function get transformX():Number
		{
			return _transformX;
		}

		public function set transformX(value:Number):void
		{
			_transformX = value;
		}

		public function get transformY():Number
		{
			return _transformY;
		}

		public function set transformY(value:Number):void
		{
			_transformY = value;
		}

		public function get maskType():String
		{
			return _maskType;
		}

		public function set maskType(value:String):void
		{
			_maskType = value;
		}

		override public function get visible():Boolean
		{
			return _visible;
			//return super.visible;
		}

		override public function set visible(value:Boolean):void
		{
			
			if(_visible != value)
			{
				_visible = value;
				
				invalidateDisplayList();
			}
			/*
			if(super.visible != value)
			{
				super.visible = value;
				
				//invalidateDisplayList();
			}
			*/
		}

		
		
		protected function renderFilter():void
		{
			var nativefilters:Array = [];
			for each(var f:IFXGFilter in _filters)
			{
				nativefilters.push( f.getFilter() );
			}
			super.filters = nativefilters;
		}
		
		
		override protected function updateDisplayList(unscaledWidth:Number=NaN, unscaledHeight:Number=NaN):void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			
			super.visible = _visible;
			
			if(filters)
			{
				renderFilter();
			}
		}
		
		public function move(x:Number, y:Number):void
		{
			super.x = x;
			super.y = y;
		}
	}
}