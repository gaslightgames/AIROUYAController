package com.gaslightgames.nativeExtensions.OUYAControllerANE
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class PlayerController extends EventDispatcher
	{
		
		public function PlayerController(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function buttonDown( keyCode:int ):void
		{
			var downEvent:OUYAControllerANEEvent = new OUYAControllerANEEvent( OUYAControllerANEEvent.BUTTON_DOWN );
			downEvent.button = keyCode;
			this.dispatchEvent( downEvent );
		}
		
		public function buttonUp( keyCode:int ):void
		{
			var upEvent:OUYAControllerANEEvent = new OUYAControllerANEEvent( OUYAControllerANEEvent.BUTTON_UP );
			upEvent.button = keyCode;
			this.dispatchEvent( upEvent );
		}
		
		public function leftStick( value:String ):void
		{
			var xySplitStrings:Array = String( value ).split( "," );
			
			var leftStickEvent:OUYAControllerANEEvent = new OUYAControllerANEEvent( OUYAControllerANEEvent.LEFT_STICK );
			leftStickEvent.button = OUYAControllerANE.LEFT_STICK_X;	// We just use the X so that a value is populated in this property
			leftStickEvent.x = xySplitStrings[0];
			leftStickEvent.y = xySplitStrings[1];
			
			this.dispatchEvent( leftStickEvent );
		}
		
		public function rightStick( value:String ):void
		{
			var xySplitStrings:Array = String( value ).split( "," );
			
			var rightStickEvent:OUYAControllerANEEvent = new OUYAControllerANEEvent( OUYAControllerANEEvent.RIGHT_STICK );
			rightStickEvent.button = OUYAControllerANE.RIGHT_STICK_X;	// We just use the X so that a value is populated in this property
			rightStickEvent.x = xySplitStrings[0];
			rightStickEvent.y = xySplitStrings[1];
			
			this.dispatchEvent( rightStickEvent );
		}
		
		public function leftTrigger( value:Number ):void
		{
			var leftTriggerEvent:OUYAControllerANEEvent = new OUYAControllerANEEvent( OUYAControllerANEEvent.LEFT_TRIGGER );
			leftTriggerEvent.button = OUYAControllerANE.LEFT_TRIGGER;
			leftTriggerEvent.x = 0.0;
			leftTriggerEvent.y = value;
			
			this.dispatchEvent( leftTriggerEvent );
		}
		
		public function rightTrigger( value:Number ):void
		{
			var rightTriggerEvent:OUYAControllerANEEvent = new OUYAControllerANEEvent( OUYAControllerANEEvent.RIGHT_TRIGGER );
			rightTriggerEvent.button = OUYAControllerANE.RIGHT_TRIGGER;
			rightTriggerEvent.x = 0.0;
			rightTriggerEvent.y = value;
			
			this.dispatchEvent( rightTriggerEvent );
		}
		
		public function touchPad( value:String ):void
		{
			var xySplitStrings:Array = String( value ).split( "," );
			
			var touchpadEvent:OUYAControllerANEEvent = new OUYAControllerANEEvent( OUYAControllerANEEvent.TOUCHPAD );
			touchpadEvent.button = OUYAControllerANE.TOUCHPAD;
			touchpadEvent.x = xySplitStrings[0];
			touchpadEvent.y = xySplitStrings[1];
			
			this.dispatchEvent( touchpadEvent );
		}
	}
}