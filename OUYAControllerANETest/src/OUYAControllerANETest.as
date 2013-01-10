package
{
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANE;
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANEEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	
	public class OUYAControllerANETest extends Sprite
	{
		private var ouyaController:OUYAControllerANE
		
		public function OUYAControllerANETest()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.init();
		}
		
		private function init():void
		{
			this.ouyaController = new OUYAControllerANE();
			
			this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.BUTTON_DOWN, buttonDown );
			this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.BUTTON_UP, buttonUp );
			this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.LEFT_STICK, leftStick );
			this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.RIGHT_STICK, rightStick );
			this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.LEFT_TRIGGER, leftTrigger );
			this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.RIGHT_TRIGGER, rightTrigger );
			this.ouyaController.player1.addEventListener( OUYAControllerANEEvent.TOUCHPAD, touchpad );
		}
		
		private function buttonDown( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Button Down" );
			
			if( OUYAControllerANE.BUTTON_O == ouyaEvent.button )
			{
				trace( "O Button Pressed" );
			}
			
			if( OUYAControllerANE.BUTTON_OUYA == ouyaEvent.button )
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