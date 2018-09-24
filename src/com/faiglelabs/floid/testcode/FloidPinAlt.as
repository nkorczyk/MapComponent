package com.faiglelabs.floid.testcode
{
	// faigelabs - test code for Floid maps - cfaigle - free
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.GlowFilter;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import mx.graphics.codec.PNGEncoder;
	import com.foxarc.util.Base64;    
	public class FloidPinAlt
	{
		public  var pinName : String = "No Name";
		public function makeIcon():String
		{
			var iconShape : Shape = makeIconShape();
			var finalBitmapData : BitmapData = new BitmapData(100, 38, true, 0x0);
			var offsetMatrix : Matrix = new Matrix();
			offsetMatrix.ty = 0;
			offsetMatrix.tx = 0;
			finalBitmapData.draw(iconShape, offsetMatrix);
			var finalBitmapPNG : ByteArray = (new PNGEncoder()).encode(finalBitmapData);
			var encodedMarkerBitmap:String = Base64.encode(finalBitmapPNG);
			return encodedMarkerBitmap;
		}
		public function makeIconShadow():String
		{
			var iconShape : Shape = makeIconShape();
			var finalBitmapData : BitmapData = new BitmapData(132, 20, true, 0x0);
			var offsetMatrix : Matrix = new Matrix();
			offsetMatrix.ty = 0;
			offsetMatrix.tx = 20;
			offsetMatrix.c  = -1;
			offsetMatrix.d  = 0.5;
			var colorTransform : ColorTransform = new ColorTransform();
			colorTransform.alphaOffset     = -160;
			colorTransform.redMultiplier   = 0.9;
			colorTransform.greenMultiplier = 0.9;
			colorTransform.blueMultiplier  = 0.9;
			colorTransform.redOffset       = 0x10;
			colorTransform.greenOffset     = 0x10;
			colorTransform.blueOffset      = 0x10;
			finalBitmapData.draw(iconShape, offsetMatrix, colorTransform);
			var finalBitmapPNG : ByteArray = (new PNGEncoder()).encode(finalBitmapData);
			var encodedMarkerBitmap:String = Base64.encode(finalBitmapPNG);
			return encodedMarkerBitmap;
		}
		public function makeIconShape():Shape
		{
			var  standardBackgroundColor:uint  = 0xFF999999;	// Gray
			var  standardLineColor:uint        = 0xFF000000;	// Black
			var  iconTextWidth:int             = 120;
			var  iconTextHeight:int            = 20;
			var  iconBarLocation:int           = 18;
			var  iconBarHeight:int             = 6;
			var  iconBarWidth:int              = 100;
			var  iconPointerStartX:int         = 14;
			var  iconPointerEndX:int           = 18;
			var  iconPointerHeight:int         = 32;
			var  iconLineBackgroundColor:int   = 0xFF000000;
			var  iconLineStyleThickness:int    = 2;
			var  iconBackgroundColor:uint      = standardBackgroundColor;
			var  lineColor:uint 	           = standardLineColor;
			// Create a shape:
			var iconShape:Shape = new Shape();
			// NEXT: Draw the line to the bottom left:
			iconShape.graphics.beginFill(iconBackgroundColor);
			iconShape.graphics.lineStyle(iconLineStyleThickness, lineColor);
			iconShape.graphics.moveTo(iconPointerStartX, iconBarLocation);
			iconShape.graphics.lineTo(0,                 iconBarHeight + iconPointerHeight);
			iconShape.graphics.lineTo(iconPointerEndX,   iconBarLocation);
			iconShape.graphics.lineTo(iconPointerStartX, iconBarLocation);
			iconShape.graphics.endFill();
			// NEXT: draw the bar:
			iconShape.graphics.beginFill(iconBackgroundColor);
			iconShape.graphics.lineStyle(iconLineStyleThickness, lineColor);
			iconShape.graphics.drawRoundRect(0, iconBarLocation-(iconBarHeight/2), iconBarWidth, iconBarHeight, 3, 3);
			iconShape.graphics.endFill();
			// Create the text for the pinName:
			var textfield:TextField = new TextField();
			var outline:GlowFilter  = new GlowFilter(0x00c0c0c0,1.0,2,2,4);
			outline.quality         = BitmapFilterQuality.MEDIUM;
			textfield.filters=[outline];
			textfield.text = pinName;
			textfield.setTextFormat(new TextFormat("Verdana", 12, 0x00000000));
			var bitmapdata:BitmapData = new BitmapData(iconTextWidth, iconTextHeight, true, 0x00000000);
			bitmapdata.draw(textfield);
			// Draw the bitmap onto the shape graphics:
			iconShape.graphics.beginBitmapFill(bitmapdata);
			iconShape.graphics.lineStyle();
			iconShape.graphics.drawRect(0, 0, iconTextWidth, iconTextHeight);
			iconShape.graphics.endFill();
			return iconShape;
		}
	}
}