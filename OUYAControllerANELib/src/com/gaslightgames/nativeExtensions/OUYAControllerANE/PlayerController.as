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
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.BUTTON_DOWN, keyCode ) );
		}
		
		public function buttonUp( keyCode:int ):void
		{
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.BUTTON_UP, keyCode ) );
		}
		
		public function leftStick( value:String ):void
		{
			var xySplitStrings:Array = String( value ).split( "," );
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.STICK_LEFT, 0, xySplitStrings[0], xySplitStrings[1] ) );
		}
		
		public function rightStick( value:String ):void
		{
			var xySplitStrings:Array = String( value ).split( "," );
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.STICK_RIGHT, 0, xySplitStrings[0], xySplitStrings[1] ) );
		}
		
		public function leftTrigger( value:Number ):void
		{
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.TRIGGER_LEFT, OUYAControllerANE.LEFT_TRIGGER, 0, value  ) );
		}
		
		public function rightTrigger( value:Number ):void
		{
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.TRIGGER_RIGHT, OUYAControllerANE.RIGHT_TRIGGER, 0, value ) );
		}
		
		public function touchPad( value:String ):void
		{
			var xySplitStrings:Array = String( value ).split( "," );
			this.dispatchEvent( new OUYAControllerANEEvent( OUYAControllerANEEvent.TOUCHPAD, OUYAControllerANE.TOUCHPAD, xySplitStrings[0], xySplitStrings[1] ) );
		}
	}
}