package com.gaslightgames.nativeExtensions.OUYAControllerANE
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.StatusEvent;
	import flash.external.ExtensionContext;
	
	public class OUYAControllerANE extends EventDispatcher
	{
		public static const LEFT_STICK_X:int			= 1;
		public static const LEFT_STICK_Y:int			= 2;
		public static const LEFT_STICK_BUTTON:int		= 3;
		public static const RIGHT_STICK_X:int			= 4;
		public static const RIGHT_STICK_Y:int			= 5;
		public static const RIGHT_STICK_BUTTON:int		= 6;
		public static const DPAD_UP:int					= 7;
		public static const DPAD_DOWN:int				= 8;
		public static const DPAD_LEFT:int				= 9;
		public static const DPAD_RIGHT:int				= 10;
		public static const BUTTON_O:int				= 11;
		public static const BUTTON_U:int				= 12;
		public static const BUTTON_Y:int				= 13;
		public static const BUTTON_A:int				= 14;
		public static const LEFT_TRIGGER:int			= 15;
		public static const RIGHT_TRIGGER:int			= 16;
		public static const LEFT_SHOULDER:int			= 17;
		public static const RIGHT_SHOULDER:int			= 18;
		public static const BUTTON_OUYA:int				= 19;
		public static const TOUCHPAD:int				= 20;
		
		public var player1:PlayerController;
		public var player2:PlayerController;
		public var player3:PlayerController;
		public var player4:PlayerController;
		
		private static var extContext:ExtensionContext = null;
		
		public function OUYAControllerANE( target:IEventDispatcher=null )
		{
			trace( "Building OUYA Controller ANE" );
			if( !extContext )
			{
				trace( "Building Extension Context" );
				extContext = ExtensionContext.createExtensionContext( "com.gaslightgames.OUYAControllerANE", "OUYAControllerANE" );
				
				extContext.call( "init" );
				
				if( extContext )
				{
					trace( "OUYA Controller ANE Initialised." );
					
					this.player1 = new PlayerController();
					this.player2 = new PlayerController();
					this.player3 = new PlayerController();
					this.player4 = new PlayerController();
					
					extContext.addEventListener( StatusEvent.STATUS, onStatus );
				}
				else
				{
					trace( "OUYA Controller ANE Initiasation FAILED!" );
				}
			}
			
			super(target);
		}
		
		private function onStatus( statusEvent:StatusEvent ):void
		{
			var splitStrings:Array = String( statusEvent.level ).split( "_" );
			
			var player:int = int( splitStrings[0] );
			var func:String;
			
			// AS3 does not support Switch with String!
			if( "DOWN" == statusEvent.code )
			{
				func = "buttonDown";
			}
			
			if( "UP" == statusEvent.code )
			{
				func = "buttonUp";
			}
			
			if( "LEFTSTICK" == statusEvent.code )
			{
				func = "leftStick";
			}
			
			if( "RIGHTSTICK" == statusEvent.code )
			{
				func = "rightStick";
			}
			
			if( "LEFTTRIGGER" == statusEvent.code )
			{
				func = "leftTrigger";
			}
			
			if( "RIGHTTRIGGER" == statusEvent.code )
			{
				func = "rightTrigger";
			}
			
			if( "TOUCHPAD" == statusEvent.code )
			{
				func = "touchPad";
			}
			
			switch( player )
			{
				case 1:
					this.player1[func]( splitStrings[1] );
					break;
				case 2:
					this.player2[func]( splitStrings[1] );
					break;
				case 3:
					this.player3[func]( splitStrings[1] );
					break;
				case 4:
					this.player4[func]( splitStrings[1] );
					break;
			}
			
		}
		
		public function test():void
		{
			extContext.call( "test" );
		}
	}
}