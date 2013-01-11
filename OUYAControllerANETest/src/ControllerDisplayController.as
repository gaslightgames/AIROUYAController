package
{
	import flash.display.MovieClip;

	public class ControllerDisplayController
	{
		private static const JOYSTICK_MAX_OFFSET:int = 13;
		
		private static const CLIP_DPAD_LEFT:String = "dpadLeft";
		private static const CLIP_DPAD_UP:String = "dpadUp";
		private static const CLIP_DPAD_RIGHT:String = "dpadRight";
		private static const CLIP_DPAD_DOWN:String = "dpadDown";
		private static const CLIP_BUTTON_SYSTEM:String = "systemButton";
		private static const CLIP_BUTTON_O:String = "oButton";
		private static const CLIP_BUTTON_U:String = "uButton";
		private static const CLIP_BUTTON_Y:String = "yButton";
		private static const CLIP_BUTTON_A:String = "aButton";
		private static const CLIP_BUTTON_L1:String = "l1";
		private static const CLIP_BUTTON_R1:String = "r1";
		private static const CLIP_TRIGGER_L2:String = "l2";
		private static const CLIP_TRIGGER_R2:String = "r2";
		private static const CLIP_BUTTON_L3:String = "l3";
		private static const CLIP_BUTTON_R3:String = "r3";
		private static const CLIP_JOYSTICK_LEFT:String = "leftJoystick";
		private static const CLIP_JOYSTICK_RIGHT:String = "rightJoystick";
		private static const CLIP_TOUCH_PAD:String = "touchPad";
		private static const CLIP_LED_1:String = "led1";
		private static const CLIP_LED_2:String = "led2";
		private static const CLIP_LED_3:String = "led3";
		private static const CLIP_LED_4:String = "led4";
		
		private var _view:MovieClip;
		
		private var _dpadLeft:MovieClip;
		private var _dpadUp:MovieClip;
		private var _dpadRight:MovieClip;
		private var _dpadDown:MovieClip;
		private var _buttonSystem:MovieClip;
		private var _buttonO:MovieClip;
		private var _buttonU:MovieClip;
		private var _buttonY:MovieClip;
		private var _buttonA:MovieClip;
		private var _buttonL1:MovieClip;
		private var _buttonR1:MovieClip;
		private var _triggerL2:MovieClip;
		private var _triggerR2:MovieClip;
		private var _buttonL3:MovieClip;
		private var _buttonR3:MovieClip;
		private var _joystickLeft:MovieClip;
		private var _joystickRight:MovieClip;
		private var _led1:MovieClip;
		private var _touchPad:MovieClip;
		private var _led2:MovieClip;
		private var _led3:MovieClip;
		private var _led4:MovieClip;
		
		private var _leftJoystickX:Number;
		private var _leftJoystickY:Number;
		private var _rightJoystickX:Number;
		private var _rightJoystickY:Number;
		
		private var _triggerScaleLeftX:Number;
		private var _triggerScaleLeftY:Number;
		private var _triggerScaleRightX:Number;
		private var _triggerScaleRightY:Number;
		
		public function ControllerDisplayController($view:MovieClip)
		{
			_view = $view;
			_view.stop();
			
			_dpadLeft = _view[CLIP_DPAD_LEFT];
			_dpadUp = _view[CLIP_DPAD_UP];
			_dpadRight = _view[CLIP_DPAD_RIGHT];
			_dpadDown = _view[CLIP_DPAD_DOWN];
			_buttonSystem = _view[CLIP_BUTTON_SYSTEM];
			_buttonO = _view[CLIP_BUTTON_O];
			_buttonU = _view[CLIP_BUTTON_U];
			_buttonY = _view[CLIP_BUTTON_Y];
			_buttonA = _view[CLIP_BUTTON_A];
			_buttonL1 = _view[CLIP_BUTTON_L1];
			_buttonR1 = _view[CLIP_BUTTON_R1];
			_triggerL2 = _view[CLIP_TRIGGER_L2];
			_triggerR2 = _view[CLIP_TRIGGER_R2];
			_buttonL3 = _view[CLIP_BUTTON_L3];
			_buttonR3 = _view[CLIP_BUTTON_R3];
			_joystickLeft = _view[CLIP_JOYSTICK_LEFT];
			_joystickRight = _view[CLIP_JOYSTICK_RIGHT];
			_touchPad = _view[CLIP_TOUCH_PAD];
			_led1 = _view[CLIP_LED_1];
			_led2 = _view[CLIP_LED_2];
			_led3 = _view[CLIP_LED_3];
			_led4 = _view[CLIP_LED_4];
			
			_dpadLeft.stop();
			_dpadUp.stop();
			_dpadRight.stop();
			_dpadDown.stop();
			_buttonSystem.stop();
			_buttonO.stop();
			_buttonU.stop();
			_buttonY.stop();
			_buttonA.stop();
			_buttonL1.stop();
			_buttonR1.stop();
			_triggerL2.stop();
			_triggerR2.stop();
			_buttonL3.stop();
			_buttonR3.stop();
			_joystickLeft.stop();
			_joystickRight.stop();
			_touchPad.stop();
			_led1.stop();
			_led2.stop();
			_led3.stop();
			_led4.stop();
			
			_leftJoystickX = _joystickLeft.x;
			_leftJoystickY = _joystickLeft.y;
			_rightJoystickX = _joystickRight.x;
			_rightJoystickY = _joystickRight.y;
			
			_triggerScaleLeftX = _triggerL2.scaleX;
			_triggerScaleLeftY = _triggerL2.scaleY;
			_triggerScaleRightX = _triggerR2.scaleX;
			_triggerScaleRightY = _triggerR2.scaleY;
		}
		
		public function oPressed():void
		{
			_buttonO.gotoAndStop(2);
		}
		
		public function oReleased():void
		{
			_buttonO.gotoAndStop(1);
		}
		
		public function uPressed():void
		{
			_buttonU.gotoAndStop(2);
		}
		
		public function uReleased():void
		{
			_buttonU.gotoAndStop(1);
		}
		
		public function yPressed():void
		{
			_buttonY.gotoAndStop(2);
		}
		
		public function yReleased():void
		{
			_buttonY.gotoAndStop(1);
		}
		
		public function aPressed():void
		{
			_buttonA.gotoAndStop(2);
		}
		
		public function aReleased():void
		{
			_buttonA.gotoAndStop(1);
		}
		
		public function leftPressed():void
		{
			_dpadLeft.gotoAndStop(2);
		}
		
		public function leftReleased():void
		{
			_dpadLeft.gotoAndStop(1);
		}
		
		public function upPressed():void
		{
			_dpadUp.gotoAndStop(2);
		}
		
		public function upReleased():void
		{
			_dpadUp.gotoAndStop(1);
		}
		
		public function rightPressed():void
		{
			_dpadRight.gotoAndStop(2);
		}
		
		public function rightReleased():void
		{
			_dpadRight.gotoAndStop(1);
		}
		
		public function downPressed():void
		{
			_dpadDown.gotoAndStop(2);
		}
		
		public function downReleased():void
		{
			_dpadDown.gotoAndStop(1);
		}
		
		public function systemPressed():void
		{
			_buttonSystem.gotoAndStop(2);
		}
		
		public function systemReleased():void
		{
			_buttonSystem.gotoAndStop(1);
		}
		
		public function l1Pressed():void
		{
			_buttonL1.gotoAndStop(2);
		}
		
		public function l1Released():void
		{
			_buttonL1.gotoAndStop(1);
		}
		
		public function r1Pressed():void
		{
			_buttonR1.gotoAndStop(2);
		}
		
		public function r1Released():void
		{
			_buttonR1.gotoAndStop(1);
		}
		
		public function l2Pressed( $value:Number ):void
		{
			trace( "L2: " + _triggerScaleLeftX, (_triggerScaleLeftX - (_triggerScaleLeftX * $value)) );
			_triggerL2.gotoAndStop(2);
			_triggerL2.scaleX = _triggerScaleLeftX - (_triggerScaleLeftX * $value);
			_triggerL2.scaleY = _triggerScaleLeftY - (_triggerScaleLeftY * $value);
		}
		
		public function l2Released():void
		{
			_triggerL2.gotoAndStop(1);
			_triggerL2.scaleX = _triggerScaleLeftX; 
			_triggerL2.scaleY = _triggerScaleLeftY;
		}
		
		public function r2Pressed( $value:Number ):void
		{
			trace( "R2: " + $value);
			_triggerR2.gotoAndStop(2);
			_triggerR2.scaleX = _triggerR2.scaleY = 1 -$value;
		}
		
		public function r2Released():void
		{
			_triggerR2.gotoAndStop(1);
			_triggerR2.scaleX = _triggerR2.scaleY = 1;
		}
		
		public function l3Pressed():void
		{
			_buttonL3.gotoAndStop(2);
		}
		
		public function l3Released():void
		{
			_buttonL3.gotoAndStop(1);
		}
		
		public function r3Pressed():void
		{
			_buttonR3.gotoAndStop(2);
		}
		
		public function r3Released():void
		{
			_buttonR3.gotoAndStop(1);
		}
		
		public function leftJoystickOffset($x:Number, $y:Number):void
		{
			if ( _joystickLeft.x != _leftJoystickX + ($x * JOYSTICK_MAX_OFFSET) ) _joystickLeft.x = _leftJoystickX + ($x * JOYSTICK_MAX_OFFSET);
			if ( _joystickLeft.y != _leftJoystickY + ($y * JOYSTICK_MAX_OFFSET) ) _joystickLeft.y = _leftJoystickY + ($y * JOYSTICK_MAX_OFFSET);
		}
		
		public function rightJoystickOffset($x:Number, $y:Number):void
		{
			if ( _joystickRight.x != _rightJoystickX + ($x * JOYSTICK_MAX_OFFSET) ) _joystickRight.x = _rightJoystickX + ($x * JOYSTICK_MAX_OFFSET);
			if ( _joystickRight.y != _rightJoystickY + ($y * JOYSTICK_MAX_OFFSET) ) _joystickRight.y = _rightJoystickY + ($y * JOYSTICK_MAX_OFFSET);
		}
		
		public function touchPadTouched():void
		{
			_touchPad.gotoAndStop(2);
		}
		
		public function touchPadUntouched():void
		{
			_touchPad.gotoAndStop(1);
		}
	}
}