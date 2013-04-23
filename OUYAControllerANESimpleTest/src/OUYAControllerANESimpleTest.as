package
{
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANE;
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANEEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class OUYAControllerANESimpleTest extends Sprite
	{
		private var ouyaController:OUYAControllerANE
		
		public function OUYAControllerANESimpleTest()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.init();
		}
		
		private function init():void
		{
			trace( "Starting Test..." );
			
			if( OUYAControllerANE.isSupported )
			{
				this.ouyaController = OUYAControllerANE.getInstance();
				
				this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.BUTTON_DOWN, buttonDown );
				this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.BUTTON_UP, buttonUp );
				this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.STICK_LEFT, leftStick );
				this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.STICK_RIGHT, rightStick );
				this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.TRIGGER_LEFT, leftTrigger );
				this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.TRIGGER_RIGHT, rightTrigger );
				this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.TOUCHPAD, touchpad );
			}
			else
			{
				trace( "Controller Not Supported" );
			}
		}
		
		private function buttonDown( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Button Down" );
			
			if( OUYAControllerANE.BUTTON_O == ouyaEvent.button )
			{
				trace( "O Button Pressed" );
			}
			
			if( OUYAControllerANE.BUTTON_MENU == ouyaEvent.button )
			{
				trace( "OUYA Home Button Pressed" );
			}
		}
		
		private function buttonUp( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Button Up" );
			
			if( OUYAControllerANE.RIGHT_SHOULDER == ouyaEvent.button )
			{
				trace( "Right Shoulder Button Released" );
			}
		}
		
		private function leftTrigger( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Left Trigger: " + ouyaEvent.y );
		}
		
		private function rightTrigger( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Right Trigger: " + ouyaEvent.y );
		}
		
		private function leftStick( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Left Stick: " + ouyaEvent.x + ", " + ouyaEvent.y );
		}
		
		private function rightStick( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Right Stick: " + ouyaEvent.x + ", " + ouyaEvent.y );
		}
		
		private function touchpad( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Touch Pad: " + ouyaEvent.x + ", " + ouyaEvent.y );
		}
	}
}