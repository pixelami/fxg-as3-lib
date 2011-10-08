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

package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import org.pixelami.fxg.renderer.FXGRenderer;
	
	[SWF(widthPercent="100",heightPercent="100",frameRate="31",backgroundColor="#F8F8F8")]
	public class Main extends Sprite
	{
		private var renderer:FXGRenderer;
		
		public function Main()
		{
			addEventListener(Event.ADDED_TO_STAGE,addedToStageHandler);
		}

		private function addedToStageHandler(event:Event):void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			init();
		}
		
		protected function init():void
		{
			renderer = new FXGRenderer();
			
			// a target sprite into which the fxg document will be rendered
			var fxgContainer:Sprite = new Sprite();
			addChild(fxgContainer);
			
			
			var loader:URLLoader = new URLLoader(new URLRequest("radialGradient-01.xml"));
			loader.addEventListener(Event.COMPLETE,function(event:Event):void 
			{
				renderer.renderElement(new XML(loader.data),fxgContainer);
			});
		}
	}
}