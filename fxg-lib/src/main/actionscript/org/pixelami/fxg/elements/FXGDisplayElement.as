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
	import flash.events.Event;
	
	
	public class FXGDisplayElement extends FXGElement implements IFXGDisplayElement
	{
		fxg_internal var displayListInvalid:Boolean;
		fxg_internal var displayListInitialized:Boolean;
		
		use namespace fxg_internal;
		
		public function FXGDisplayElement()
		{
			addEventListener(Event.ADDED_TO_STAGE,OnAddedToStage);
		}
		
		protected function createChildren():void
		{
			
		}
		
		public function invalidateDisplayList():void
		{
			if(!displayListInvalid)
			{
				displayListInvalid = true;
				addEventListener(Event.ENTER_FRAME,OnEnterFrame);
			}
		}
		
		protected function validateNow():void
		{
			displayListInvalid = false;
			updateDisplayList();
		}
		
		protected function OnEnterFrame(event:Event):void
		{
			removeEventListener(Event.ENTER_FRAME,OnEnterFrame);
			displayListInvalid = false;
			updateDisplayList();
		}
		
		protected function updateDisplayList(unscaledWidth:Number=NaN,unscaledHeight:Number=NaN):void
		{
			if(!displayListInitialized)
			{
				createChildren();
			}
		}
		
		
		
		protected function OnAddedToStage(event:Event):void
		{
			//trace(event);
		}
	}
}