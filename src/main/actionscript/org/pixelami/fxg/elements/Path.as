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
	import flash.display.Graphics;
	import flash.display.GraphicsPath;
	
	import org.pixelami.fxg.utils.PathSegmentsCollection;
	import org.pixelami.fxg.elements.fills.LinearGradient;
	
	
	public class Path extends FXGShapeElement
	{
		private var _data:String;
		
		private var pathSegments:PathSegmentsCollection;
		private var graphicsPath:GraphicsPath;
		
		protected var drawn:Boolean;
		
		public function Path()
		{
			super();
		}
		
		/**
		 * The definition of the outline of a shape. See [Path data].
		 */
		public function get data():String
		{
			return _data;
		}

		public function set data(value:String):void
		{
			_data = value;
		}
		
		
		
		override protected function renderFill() : void
		{
			var g:Graphics = fillShape.graphics;
			
			if(fill)
			{
				getPathCommands();
				
				fill.beginFill(g);
				fillShape.graphics.drawPath(graphicsPath.commands,graphicsPath.data);
				if(!drawn) 
				{
					drawn = true;
					// redraw with a lineargradient
				}
				fill.endFill(fillShape.graphics);
				
				
				// assumption is that for paths with any type of gradient fill we need to 
				// tell the fill about the bounds of the target object
				if((fill is LinearGradient))
				{
					LinearGradient(fill).createMatrix(fillShape.getBounds(this));
					fill.beginFill(g);
					g.drawPath(graphicsPath.commands,graphicsPath.data);
					fill.endFill(g);
				}
			}
			
		}
		
		override protected function renderStroke() : void
		{
			var g:Graphics = strokeShape.graphics;
			
			if(stroke)
			{
				
				stroke.doStroke(g);
				
				// sometimes a fill will not have happended 
				// so we will need to call getPathCommands()
				if(!graphicsPath) getPathCommands();
				g.drawPath(graphicsPath.commands,graphicsPath.data);
			}
			
		}
		
		private function getPathCommands():void
		{
			var tx:Number = 0;
			var ty:Number = 0;
			var sx:Number = 1//element.@width;
			var sy:Number = 1//element.@height;
			
			pathSegments = new PathSegmentsCollection(data);
			graphicsPath = new GraphicsPath();
			pathSegments.generateGraphicsPath(graphicsPath,tx,ty,sx,sy);
			
		}

	}
}