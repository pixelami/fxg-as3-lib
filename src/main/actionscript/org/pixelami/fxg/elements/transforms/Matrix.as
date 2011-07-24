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

package org.pixelami.fxg.elements.transforms
{
	import flash.geom.Matrix;

	public class Matrix
	{
		private var _a:Number = 0;
		private var _b:Number = 0;
		private var _c:Number = 0;
		private var _d:Number = 0;
		private var _tx:Number = 0;
		private var _ty:Number = 0;
		
		/**
		 * The top left coefficient of the matrix.
		 */
		public function get a():Number
		{
			return _a;
		}

		public function set a(value:Number):void
		{
			_a = value;
		}
		
		/**
		 * The top center coefficient of the matrix.
		 */

		public function get b():Number
		{
			return _b;
		}

		public function set b(value:Number):void
		{
			_b = value;
		}
	
		/**
		 * The center left coefficient of the matrix.
		 */
		
		public function get c():Number
		{
			return _c;
		}

		public function set c(value:Number):void
		{
			_c = value;
		}
		
		/**
		 * The center center coefficient of the matrix.
		 */
		
		public function get d():Number
		{
			return _d;
		}

		public function set d(value:Number):void
		{
			_d = value;
		}

		/**
		 * The top right coefficient of the matrix.
		 */
		
		public function get tx():Number
		{
			return _tx;
		}

		public function set tx(value:Number):void
		{
			_tx = value;
		}

		/**
		 * The center right coefficient of the matrix.
		 */
		
		public function get ty():Number
		{
			return _ty;
		}

		public function set ty(value:Number):void
		{
			_ty = value;
		}

		public function getMatrix():flash.geom.Matrix
		{
			return new flash.geom.Matrix(a,b,c,d,tx,ty);
		}
	}
}