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

/*
Text Formatting

Formatting properties are set directly on the element as XML attributes. Properties can be inherited from the parent, but they are not applied in styles as in CSS.
Character Style Attributes

The following character style attributes can be applied to the <TextGraphic>, <p>, or <span> elements, and apply to the direct content of the element. Attributes are inherited from the parent element, if there is one, and cascade down from the TextGraphic element.

* fontFamily <String>: The font family name used to render the text. If no font is supplied, the client will pick one that is a variant of the Times family, dependent on platform. Which font is used for rendering the text is up to the client and also depends on the glyphs that are being rendered and the fonts that are available. Default value is Times New Roman (Times on Mac OS X).
* fontSize <Number>: The size of the glyphs that is used to render the text, specified in point sizes. Default is 12. Minimum 1 point. Maximum 500 points.
* fontStyle <String> (normal, italic): The style of the glyphs that is used to render the text. Legal values are 'normal' and 'italic'. Default is normal.
* fontWeight <String>(normal, bold): The boldness or lightness of the glyphs that is used to render the text. Default is normal.
* lineHeight <Percent> | <Number>: The leading, or the distance from the previous line's baseline to this one, in points. This can be specified in absolute pixels, or as a percentage of the point size. Default is 120%. Minimum value for percent or number is 0.
* tracking <Percent>: Space added to the advance after each character, as a percentage of the current point size. Percentages can be negative, to bring characters closer together. Default is 0.
* textDecoration <String> (none, underline): The decoration to apply to the text. Default is none.
* lineThrough <Boolean>: true if text has strikethrough applied, false otherwise. Default is false.
* color <Color>: The color of the text. Default is 0x000000.
* textAlpha <alpha>: The alpha value applied to the text. Default is 1.0.
* whiteSpaceCollapse <String> (preserve, collapse): This is an enumerated value. A value of "collapse" converts line feeds, newlines, and tabs to spaces and collapses adjacent spaces to one. See [Text collapse examples] for details on collapse handling. Updated:-Leading and trailing whitespace is trimmed. A value of "preserve" passes whitespace through unchanged,except as noted earlier, when the whitespace would result in an implied <p> and <span> that is all whitespace, in which case the whitespace is removed.
* lineBreak <String> (toFit, explicit): This is an enumeration. A value of "toFit" wraps the lines at the edge of the enclosing TextGraphic. A value of "explicit" breaks the lines only at a Unicode line end character (such as a newline or line separator). toFit is the default.
* kerning <String> (on, off, auto): If on, pair kerns are honored. If off, there is no font-based kerning applied. If auto, kerning is applied to all characters except Kanji, Hiragana or Katakana. The default is auto.

Otherwise characters are drawn with no pair kerning adjustments. True is the default.
Paragraph Attributes

The following paragraph attributes can be applied to TextGraphic or p elements:

* textAlign <String> (left, center, right, justify): The alignment of the text relative to the text box edges. Default is left.
* textAlignLast <String> (left, center, right, justify): The alignment of the last line of the paragraph, applies if textAlign is justify. To make a paragraph set all lines justified, set textAlign and textAlignLast to justify. Default is left.
* textIndent <Number>: The indentation of the first line of text in a paragraph. The indent is relative to the left margin. Measured in pixels. Default is 0. Can be negative.
* marginLeft <Number>: The indentation applied to the left edge. Measured in pixels. Default is 0.
* marginRight <Number>: The indentation applied to the right edge. Measured in pixels. Default is 0.
* marginTop <Number>: This is the "space before" the paragraph. As in CSS, adjacent vertical space collapses. Given two adjoining paragraphs (A, B), where A has marginBottom 12 and B has marginBottom 24, the total space between the paragraphs is 24, the maximum of the two, and not 36, the sum. If the paragraph is at the top of the column, no extra space is left for the margin. This might be different from CSS. Default is 0. Minimum is 0.
* marginBottom <Number>: This is the "spaceAfter" the paragraph. As in CSS, adjacent vertical space collapses (see note for marginTop). No margin is necessary if the paragraph falls at the bottom of the TextGraphic. Default is 0. Minimum is 0.
* direction <String> (ltr, rtl): Controls the dominant writing direction for the paragraphs (left-to-right or right-to-left), and how characters with no implicit writing direction, such as punctuation, are treated. Default is left-to-right.
* blockProgression <String> (tb, rl): Controls the direction in which lines are stacked. In Latin text, this is tb, because lines start at the top and proceed downward. In vertical Chinese or Japanese, this is rl, because lines should start at the right side of the container and proceed leftward. (Note, post FXG 1.0 lockdown, the 'lr' value was removed. Some FXG processors may still reference the lr value).

TextGraphic Attributes

These attributes can only be applied to TextGraphic.

The following attributes are the same as for all graphic element types and Group:

* rotation <Number> (ASDegrees): Defaults to 0.
* scaleX <Number>: Defaults to 1.
* scaleY <Number>: Defaults to 1.
* x <Number>: The horizontal placement of the left edge of the text box, relative to the parent grouping element. Defaults to 0.
* y <Number>: The vertical placement of the top edge of the text box, relative to the parent grouping element. Defaults to 0.
* blendMode <String> (normal, add, alpha, darken, difference, erase, hardlight, invert, layer, lighten, multiply, normal, subtract, screen, overlay): Defaults to normal.
* alpha <Number> (ASAlpha): Defaults to 1.
* id <String> (ASIdentifier): Optional, no default ("" empty string).
* transformX <Number>: Defaults to 0.
* transformY <Number>: Defaults to 0.
* maskType <String> (clip, alpha): Defaults to clip.
* visible <Boolean>: Whether or not the text box is visible. Defaults to true.

These attributes are only for TextGraphic:

* width <Number>: The width of the text box to render text in. If no width is specified, one is calculated by the client based on the content (see TextBox section for a full discussion).
* height <Number>: The height of the text box to render text in. If no height is specified, one is calculated by the client based on the content. (See TextBox section for a full discussion).
* paddingLeft <Number>: Inset from left edge to content area. Units in pixels, defaults to 0.
* paddingRight <Number>: Inset from right edge to content area. Units in pixels, defaults to 0.
* paddingTop <Number>: Inset from top edge to content area. Units in pixels, defaults to 0.
* paddingBottom <Number>: Inset from bottom edge to content area. Units in pixels, defaults to 0.

The distance from the top of the container to the baseline of the first line of text is equal to the line's ascent.

By default, the parts of a TextGraphic are transparent where text doesn't get inked.
*/

package org.pixelami.fxg.elements
{
	import flash.events.Event;
	import flash.text.engine.ElementFormat;
	import flash.text.engine.FontDescription;
	import flash.text.engine.TextBlock;
	import flash.text.engine.TextElement;
	import flash.text.engine.TextLine;
	
	import org.pixelami.fxg.elements.FXGPlacedElement;
	
	
	[DefaultProperty("content")]
	public class TextGraphic extends FXGPlacedElement implements IFXGElement, IContentContainerElement
	{
		private var _fontFamily:String = "Arial";
		private var _fontSize:Number = 12;
		private var _fontStyle:String = "normal";
		private var _fontWeight:String = "normal";
		private var _lineHeight:Number = 120;
		private var _tracking:Number = 0;
		private var _textDecoration:String = "none";
		private var _lineThrough:Boolean = false;
		private var _color:uint = 0x000000;
		private var _textAlpha:Number = 1;
		private var _whiteSpaceCollapse:Number ;
		private var _lineBreak:String = "toFit";
		private var _kerning:String = "auto";
		
		
		
		private var _width:Number; // <Number>: The width of the text box to render text in. If no width is specified, one is calculated by the client based on the content (see TextBox section for a full discussion).
		private var _height:Number; // <Number>: The height of the text box to render text in. If no height is specified, one is calculated by the client based on the content. (See TextBox section for a full discussion).
		private var _paddingLeft:Number = 0; // <Number>: Inset from left edge to content area. Units in pixels, defaults to 0.
		private var _paddingRight:Number = 0; // <Number>: Inset from right edge to content area. Units in pixels, defaults to 0.
		private var _paddingTop:Number = 0; // <Number>: Inset from top edge to content area. Units in pixels, defaults to 0.
		private var _paddingBottom:Number = 0; // <Number>: Inset from bottom edge to content area. Units in pixels, defaults to 0.
		
		private var _content:Object;
		
		protected var textElement:TextElement;
		protected var elementFormat:ElementFormat;
		
		
		
		
		public function TextGraphic()
		{
			super();
		}
		
		
		
		override public function get width():Number
		{
			return _width;
		}

		override public function set width(value:Number):void
		{
			_width = value;
		}

		override public function get height():Number
		{
			return _height;
		}

		override public function set height(value:Number):void
		{
			_height = value;
		}

		public function get paddingLeft():Number
		{
			return _paddingLeft;
		}

		public function set paddingLeft(value:Number):void
		{
			_paddingLeft = value;
		}

		public function get paddingRight():Number
		{
			return _paddingRight;
		}

		public function set paddingRight(value:Number):void
		{
			_paddingRight = value;
		}

		public function get paddingTop():Number
		{
			return _paddingTop;
		}

		public function set paddingTop(value:Number):void
		{
			_paddingTop = value;
		}

		public function get paddingBottom():Number
		{
			return _paddingBottom;
		}

		public function set paddingBottom(value:Number):void
		{
			_paddingBottom = value;
		}

		public function get content():Object
		{
			return _content;
		}

		public function set content(value:Object):void
		{
			if(_content != value)
			{
				_content = value;
				invalidateDisplayList();
			}
			
		}
		
		/*
		public function get textElement():TextElement
		{
			return _textElement;
		}

		public function set textElement(value:TextElement):void
		{
			_textElement = value;
		}

		public function get elementFormat():ElementFormat
		{
			return _elementFormat;
		}

		public function set elementFormat(value:ElementFormat):void
		{
			_elementFormat = value;
		}
		*/
		
		
		
		
		/**
		 * The font family name used to render the text. If no font is supplied, the client will pick one that is a variant of the Times family, dependent on platform. Which font is used for rendering the text is up to the client and also depends on the glyphs that are being rendered and the fonts that are available. Default value is Times New Roman (Times on Mac OS X).
		 */
		public function get fontFamily():String
		{
			return _fontFamily;
		}

		public function set fontFamily(value:String):void
		{
			_fontFamily = value;
		}

		/**
		 * The size of the glyphs that is used to render the text, specified in point sizes. Default is 12. Minimum 1 point. Maximum 500 points.
		 */
		public function get fontSize():Number
		{
			return _fontSize;
		}

		public function set fontSize(value:Number):void
		{
			_fontSize = value;
		}

		/**
		 * (normal, italic): The style of the glyphs that is used to render the text. Legal values are 'normal' and 'italic'. Default is normal.
		 */
		public function get fontStyle():String
		{
			return _fontStyle;
		}

		public function set fontStyle(value:String):void
		{
			_fontStyle = value;
		}

		/**
		 * (normal, bold): The boldness or lightness of the glyphs that is used to render the text. Default is normal.
		 */
		public function get fontWeight():String
		{
			return _fontWeight;
		}

		public function set fontWeight(value:String):void
		{
			_fontWeight = value;
		}

		/**
		 * The leading, or the distance from the previous line's baseline to this one, in points. This can be specified in absolute pixels, or as a percentage of the point size. Default is 120%. Minimum value for percent or number is 0.
		 */
		public function get lineHeight():Number
		{
			return _lineHeight;
		}

		public function set lineHeight(value:Number):void
		{
			_lineHeight = value;
		}

		/**
		 * Space added to the advance after each character, as a percentage of the current point size. Percentages can be negative, to bring characters closer together. Default is 0.
		 */
		public function get tracking():Number
		{
			return _tracking;
		}

		public function set tracking(value:Number):void
		{
			_tracking = value;
		}

		/**
		 * (none, underline): The decoration to apply to the text. Default is none.
		 */
		public function get textDecoration():String
		{
			return _textDecoration;
		}

		public function set textDecoration(value:String):void
		{
			_textDecoration = value;
		}

		/**
		 * true if text has strikethrough applied, false otherwise. Default is false.
		 */
		public function get lineThrough():Boolean
		{
			return _lineThrough;
		}

		public function set lineThrough(value:Boolean):void
		{
			_lineThrough = value;
		}

		/**
		 * The color of the text. Default is 0x000000.
		 */
		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			if(_color != value)
			{
				_color = value;
				invalidateDisplayList();
			}
		}

		/**
		 * The alpha value applied to the text. Default is 1.0.
		 */
		public function get textAlpha():Number
		{
			return _textAlpha;
		}

		public function set textAlpha(value:Number):void
		{
			_textAlpha = value;
		}

		/**
		 * (preserve, collapse): This is an enumerated value. A value of "collapse" converts line feeds, newlines, and tabs to spaces and collapses adjacent spaces to one. See [Text collapse examples] for details on collapse handling. Updated:-Leading and trailing whitespace is trimmed. A value of "preserve" passes whitespace through unchanged,except as noted earlier, when the whitespace would result in an implied <p> and <span> that is all whitespace, in which case the whitespace is removed.
		 */
		public function get whiteSpaceCollapse():Number
		{
			return _whiteSpaceCollapse;
		}

		public function set whiteSpaceCollapse(value:Number):void
		{
			_whiteSpaceCollapse = value;
		}

		/**
		 * (toFit, explicit): This is an enumeration. A value of "toFit" wraps the lines at the edge of the enclosing TextGraphic. A value of "explicit" breaks the lines only at a Unicode line end character (such as a newline or line separator). toFit is the default.
		 */
		public function get lineBreak():String
		{
			return _lineBreak;
		}

		public function set lineBreak(value:String):void
		{
			_lineBreak = value;
		}

		/**
		 * (on, off, auto): If on, pair kerns are honored. If off, there is no font-based kerning applied. If auto, kerning is applied to all characters except Kanji, Hiragana or Katakana. The default is auto.
		 */
		public function get kerning():String
		{
			return _kerning;
		}

		public function set kerning(value:String):void
		{
			_kerning = value;
		}


		/*
		override public function renderElement():void
		{
			super.renderElement()
			renderContent();
		}
		*/
		
		override protected function updateDisplayList(unscaledWidth:Number=NaN, unscaledHeight:Number=NaN):void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			renderContent();
		}
		
		protected function renderContent():void
		{
			if(content)
			{
				// Fixme - implement a textFlow renderer.
				var text:String = content.toString();
				var format:ElementFormat = getDefaultElementFormat()
				var textElement:TextElement = new TextElement(text, format); 
				var textBlock:TextBlock = new TextBlock();
				textBlock.content = textElement; 
				createLines(textBlock);
			}
		}
		
		protected function getDefaultElementFormat():ElementFormat
		{
			
			var fontFamily:String = fontFamily;
			var fontSize:Number = fontSize;
			var color:uint = color;
			
			//FontDescription args 
			// fontName:String = "_serif", fontWeight:String = "normal", fontPosture:String = "normal", 
			// fontLookup:String = "device", renderingMode:String = "cff", cffHinting:String = "horizontalStem"
			var fd:FontDescription = new FontDescription(fontFamily,fontWeight,fontStyle);
			var format:ElementFormat = new ElementFormat(fd, fontSize, color);
			return format;
		}
		
		private function createLines(textBlock:TextBlock):void 
		{
			
			var xPos:Number = 0;
			var yPos:Number = 0;

			
			var w:Number = parent.width;
			if(!width) w = width;
			
			
			var textLine:TextLine;
			
			if(w) 
			{
				textLine = textBlock.createTextLine (null,w);
				
			}
			else
			{
				textLine = textBlock.createTextLine (null);
			}

			
			var maxTextWidth:Number = Number.MIN_VALUE;
			
			while(textLine)
			{
				if(textLine.width > maxTextWidth) maxTextWidth = textLine.width;
				addChild(textLine);
				textLine.x = 0;
				yPos += textLine.textHeight;
				textLine.y = yPos;
				textLine = textBlock.createTextLine(textLine, w);
				
				
			}
			// need to dispatch a resize 
			_width = maxTextWidth;  
			dispatchEvent(new Event(Event.RESIZE));
		}

		
		
		
	}
}