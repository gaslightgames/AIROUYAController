package com.gaslightgames.nativeExtensions.OUYAControllerANE
{
	import flash.events.Event;
	
	public class OUYAControllerANEEvent extends Event
	{		
		public static const BUTTON_DOWN:String				= "buttondown";
		public static const BUTTON_UP:String				= "buttonup";
		
		public static const TRIGGER_LEFT:String				= "lefttrigger";
		public static const TRIGGER_RIGHT:String			= "righttrigger";
		
		public static const STICK_LEFT:String				= "leftstick";
		public static const STICK_RIGHT:String				= "rightstick";
		
		public static const TOUCHPAD:String					= "touchpad";
		
		private var _button:int;
		private var _x:Number;
		private var _y:Number;
		
		public function OUYAControllerANEEvent( type:String, button:int = 0, x:Number = 0, y:Number = 0, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			_button = button;
			_x = x;
			_y = y;
			super( type, bubbles, cancelable );
		}

		public function get button():int
		{
			return _button;
		}
		
		public function get x():Number
		{
			return _x;
		}

		public function get y():Number
		{
			return _y;
		}
	}
}