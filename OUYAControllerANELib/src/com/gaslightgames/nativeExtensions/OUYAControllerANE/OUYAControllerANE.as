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
		
		public var leftStickBtn:Boolean					= false;
		public var rightStickBtn:Boolean				= false;
		
		public var dpadUp:Boolean						= false;
		public var dpadDown:Boolean						= false;
		public var dpadLeft:Boolean						= false;
		public var dpadRight:Boolean					= false;
		
		public var button_O:Boolean						= false;
		public var button_U:Boolean						= false;
		public var button_Y:Boolean						= false;
		public var button_A:Boolean						= false;
		
		public var leftTriggerBtn:Boolean				= false;
		public var rightTriggerBtn:Boolean				= false;
		
		public var leftShoulderBtn:Boolean				= false;
		public var rightShoulderBtn:Boolean				= false;
		
		public var leftStickX:Number					= 0.0;
		public var leftStickY:Number					= 0.0;
		public var rightStickX:Number					= 0.0;
		public var rightStickY:Number					= 0.0;
		public var leftTrigger:Number					= 0.0;
		public var rightTrigger:Number					= 0.0;
		
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
			// AS3 does not support Switch with String!
			if( "DOWN" == statusEvent.code )
			{
				trace( "Button Down: " + statusEvent.level );
				//this.down( int( statusEvent.level ) );
			}
			
			if( "UP" == statusEvent.code )
			{
				trace( "Button Up: " + statusEvent.level );
				//this.up( int( statusEvent.level ) );
			}
			
			if( "LSX" == statusEvent.code )
			{
				this.lsx( Number( statusEvent.level ) );
			}
			
			if( "LSY" == statusEvent.code )
			{
				this.lsy( Number( statusEvent.level ) );
			}
			
			if( "RSX" == statusEvent.code )
			{
				this.rsx( Number( statusEvent.level ) );
			}
			
			if( "RSY" == statusEvent.code )
			{
				this.rsy( Number( statusEvent.level ) );
			}
			
			if( "LT" == statusEvent.code )
			{
				this.lt( Number( statusEvent.level ) );
			}
			
			if( "RT" == statusEvent.code )
			{
				this.rt( Number( statusEvent.level ) );
			}
		}
		
		private function down( keyCode:int ):void
		{
			trace( "KeyCode: " + keyCode );
			
			switch( keyCode )
			{
				case LEFT_STICK_BUTTON:
					this.leftStickBtn = true;
					break;
				case RIGHT_STICK_BUTTON:
					this.rightStickBtn = true;
					break;
				case DPAD_UP:
					this.dpadUp = true;
					break;
				case DPAD_DOWN:
					this.dpadDown = true;
					break;
				case DPAD_LEFT:
					this.dpadLeft = true;
					break;
				case DPAD_RIGHT:
					this.dpadRight = true;
					break;
				case BUTTON_O:
					this.button_O = true;
					break;
				case BUTTON_U:
					this.button_U = true;
					break;
				case BUTTON_Y:
					this.button_Y = true;
					break;
				case BUTTON_A:
					this.button_A = true;
					break;
				case LEFT_TRIGGER:
					this.leftTriggerBtn = true;
					break;
				case RIGHT_TRIGGER:
					this.rightTriggerBtn = true;
					break;
				case LEFT_SHOULDER:
					this.leftShoulderBtn = true;
					break;
				case RIGHT_SHOULDER:
					this.rightShoulderBtn = true;
					break;
			}
			
			// Dispatch event for button
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.BUTTON_DOWN ) );
		}
		
		private function up( keyCode:int ):void
		{
			switch( keyCode )
			{
				case LEFT_STICK_BUTTON:
					this.leftStickBtn = false;
					break;
				case RIGHT_STICK_BUTTON:
					this.rightStickBtn = false;
					break;
				case DPAD_UP:
					this.dpadUp = false;
					break;
				case DPAD_DOWN:
					this.dpadDown = false;
					break;
				case DPAD_LEFT:
					this.dpadLeft = false;
					break;
				case DPAD_RIGHT:
					this.dpadRight = false;
					break;
				case BUTTON_O:
					this.button_O = false;
					break;
				case BUTTON_U:
					this.button_U = false;
					break;
				case BUTTON_Y:
					this.button_Y = false;
					break;
				case BUTTON_A:
					this.button_A = false;
					break;
				case LEFT_TRIGGER:
					this.leftTriggerBtn = false;
					break;
				case RIGHT_TRIGGER:
					this.rightTriggerBtn = false;
					break;
				case LEFT_SHOULDER:
					this.leftShoulderBtn = false;
					break;
				case RIGHT_SHOULDER:
					this.rightShoulderBtn = false;
					break;
			}
			
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.BUTTON_UP ) );
		}
		
		private function lsx( value:Number ):void
		{
			this.leftStickX = value;
			
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.LEFT_STICK_X ) );
		}
		
		private function lsy( value:Number ):void
		{
			this.leftStickY = value;
			
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.LEFT_STICK_Y ) );
		}
		
		private function rsx( value:Number ):void
		{
			this.rightStickX = value;
			
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.RIGHT_STICK_X ) );
		}
		
		private function rsy( value:Number ):void
		{
			this.rightStickY = value;
			
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.RIGHT_STICK_Y ) );
		}
		
		private function lt( value:Number ):void
		{
			this.leftTrigger = value;
			
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.LEFT_TRIGGER ) );
		}
		
		private function rt( value:Number ):void
		{
			this.rightTrigger = value;
			
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.RIGHT_TRIGGER ) );
		}
		
		public function test():void
		{
			extContext.call( "test" );
		}
	}
}