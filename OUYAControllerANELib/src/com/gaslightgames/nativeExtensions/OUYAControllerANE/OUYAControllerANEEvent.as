package com.gaslightgames.nativeExtensions.OUYAControllerANE
{
	import flash.events.Event;
	
	public class OUYAControllerANEEvent extends Event
	{		
		public static const BUTTON_DOWN:String				= "buttondown";
		public static const BUTTON_UP:String				= "buttonup";
		
		public static const LEFT_STICK:String				= "leftstick";
		public static const RIGHT_STICK:String				= "rightstick";
		
		public static const LEFT_TRIGGER:String				= "lefttrigger";
		public static const RIGHT_TRIGGER:String			= "righttrigger";
		
		public static const TOUCHPAD:String					= "touchpad";
		
		public var button:int 	= 0;
		public var x:Number 	= 0.0;
		public var y:Number		= 0.0;
		
		public function OUYAControllerANEEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}
	}
}