package com.gaslightgames.nativeExtensions.OUYAControllerANE
{
	import flash.events.Event;
	
	public class OUYAControllerANEEvent extends Event
	{		
		public static const BUTTON_DOWN:String				= "buttondown";
		public static const BUTTON_UP:String				= "buttonup";
		
		public static const LEFT_STICK_X:String				= "leftstickx";
		public static const LEFT_STICK_Y:String				= "rightsticky";
		public static const RIGHT_STICK_X:String			= "rightstickx";
		public static const RIGHT_STICK_Y:String			= "rightsticky";
		
		public static const LEFT_TRIGGER:String				= "lefttrigger";
		public static const RIGHT_TRIGGER:String			= "righttrigger";
		
		public function OUYAControllerANEEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}
	}
}