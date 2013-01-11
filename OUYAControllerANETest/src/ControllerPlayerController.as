package
{
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANE;
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANEEvent;
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.PlayerController;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class ControllerPlayerController
	{
		private var _controller:ControllerDisplayController;
		private var _player:PlayerController;
		
		private var _resetTimer:Timer;
		
		public function ControllerPlayerController( $controller:ControllerDisplayController, $player:PlayerController )
		{
			_controller = $controller;
			_player = $player;
			
			_player.addEventListener( OUYAControllerANEEvent.BUTTON_DOWN, buttonDown );
			_player.addEventListener( OUYAControllerANEEvent.BUTTON_UP, buttonUp );
			_player.addEventListener( OUYAControllerANEEvent.STICK_LEFT, leftStick );
			_player.addEventListener( OUYAControllerANEEvent.STICK_RIGHT, rightStick );
			_player.addEventListener( OUYAControllerANEEvent.TRIGGER_LEFT, leftTrigger );
			_player.addEventListener( OUYAControllerANEEvent.TRIGGER_RIGHT, rightTrigger );
			_player.addEventListener( OUYAControllerANEEvent.TOUCHPAD, touchpad );			
		}
		
		private function buttonDown( ouyaEvent:OUYAControllerANEEvent ):void
		{
			switch (ouyaEvent.button)
			{
				case OUYAControllerANE.BUTTON_O:
					_controller.oPressed();
					break;
				case OUYAControllerANE.BUTTON_U:
					_controller.uPressed();
					break;
				case OUYAControllerANE.BUTTON_Y:
					_controller.yPressed();
					break;
				case OUYAControllerANE.BUTTON_A:
					_controller.aPressed();
					break;
				case OUYAControllerANE.DPAD_LEFT:
					_controller.leftPressed();
					break;
				case OUYAControllerANE.DPAD_UP:
					_controller.upPressed();
					break;
				case OUYAControllerANE.DPAD_RIGHT:
					_controller.rightPressed();
					break;
				case OUYAControllerANE.DPAD_DOWN:
					_controller.downPressed();
					break;
				case OUYAControllerANE.LEFT_SHOULDER:
					_controller.l1Pressed();
					break;
				case OUYAControllerANE.RIGHT_SHOULDER:
					_controller.r1Pressed();
					break;
				case OUYAControllerANE.LEFT_STICK_BUTTON:
					_controller.l3Pressed();
					break;
				case OUYAControllerANE.RIGHT_STICK_BUTTON:
					_controller.r3Pressed();
					break;
				case OUYAControllerANE.BUTTON_SYSTEM:
					_controller.systemPressed();
			}
		}
		
		private function buttonUp( ouyaEvent:OUYAControllerANEEvent ):void
		{
			switch (ouyaEvent.button)
			{
				case OUYAControllerANE.BUTTON_O:
					_controller.oReleased();
					break;
				case OUYAControllerANE.BUTTON_U:
					_controller.uReleased();
					break;
				case OUYAControllerANE.BUTTON_Y:
					_controller.yReleased();
					break;
				case OUYAControllerANE.BUTTON_A:
					_controller.aReleased();
					break;
				case OUYAControllerANE.DPAD_LEFT:
					_controller.leftReleased();
					break;
				case OUYAControllerANE.DPAD_UP:
					_controller.upReleased();
					break;
				case OUYAControllerANE.DPAD_RIGHT:
					_controller.rightReleased();
					break;
				case OUYAControllerANE.DPAD_DOWN:
					_controller.downReleased();
					break;
				case OUYAControllerANE.LEFT_SHOULDER:
					_controller.l1Released();
					break;
				case OUYAControllerANE.RIGHT_SHOULDER:
					_controller.r1Released();
					break;
				case OUYAControllerANE.LEFT_STICK_BUTTON:
					_controller.l3Released();
					break;
				case OUYAControllerANE.RIGHT_STICK_BUTTON:
					_controller.r3Released();
					break;
				case OUYAControllerANE.BUTTON_SYSTEM:
					_controller.systemReleased();
			}
		}
		
		private function leftTrigger( ouyaEvent:OUYAControllerANEEvent ):void
		{
			if ( ouyaEvent.y > 0.2 )
			{
				_controller.l2Pressed( ouyaEvent.y );
			}
			else
			{
				_controller.l2Released();
			}
			
			reset();
		}
		
		private function rightTrigger( ouyaEvent:OUYAControllerANEEvent ):void
		{
			if ( ouyaEvent.y > 0.01 )
			{
				_controller.r2Pressed( ouyaEvent.y );
			}
			else
			{
				_controller.r2Released();
			}
			
			reset();
		}
		
		private function leftStick( $ouyaEvent:OUYAControllerANEEvent ):void
		{
			/*if ( ( $ouyaEvent.x > 0.01 ) || ( $ouyaEvent.x < -0.01 ) || ( $ouyaEvent.y > 0.01 ) || ( $ouyaEvent.y < -0.01 ) )
			{
				_controller.leftJoystickOffset( $ouyaEvent.x, $ouyaEvent.y );
			}
			else
			{
				_controller.leftJoystickOffset(0,0);
			}*/
			
			_controller.leftJoystickOffset( $ouyaEvent.x, $ouyaEvent.y );
			
			reset();
		}
		
		private function rightStick( $ouyaEvent:OUYAControllerANEEvent ):void
		{
			/*if (( $ouyaEvent.x > 0.01) || ( $ouyaEvent.x < -0.01) || ( $ouyaEvent.y > 0.01) || ( $ouyaEvent.y < -0.01))
			{
				_controller.rightJoystickOffset( $ouyaEvent.x, $ouyaEvent.y);
			}
			else
			{
				_controller.rightJoystickOffset(0,0);
			}*/
			
			_controller.rightJoystickOffset( $ouyaEvent.x, $ouyaEvent.y );
			
			reset();
		}
		
		private function touchpad( $ouyaEvent:OUYAControllerANEEvent ):void
		{
			_controller.touchPadTouched();
			//trace( "Touch Pad: " + $ouyaEvent.x + ", " + $ouyaEvent.y );
			reset();
		}
		
		private function reset( $interval:int = 50 ):void
		{
			if (_resetTimer)
			{
				_resetTimer.delay = $interval;
				_resetTimer.reset();
				_resetTimer.stop();
			}
			
			_resetTimer = new Timer($interval, 1);
			_resetTimer.addEventListener( TimerEvent.TIMER_COMPLETE, resetHandler );
			_resetTimer.start();
		}
		
		private function resetHandler( $event:Event ):void
		{
			_resetTimer.removeEventListener( TimerEvent.TIMER_COMPLETE, resetHandler);
			_resetTimer = null;
			
			resetValues();
		}
		
		private function resetValues():void
		{
			_controller.l2Released();
			_controller.r2Released();
			_controller.leftJoystickOffset(0,0);
			_controller.rightJoystickOffset(0,0);
			_controller.touchPadUntouched();
		}
	}
}