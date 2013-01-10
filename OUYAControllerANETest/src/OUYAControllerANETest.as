package
{
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANE;
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANEEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
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
			
			this.ouyaController.addEventListener( OUYAControllerANEEvent.BUTTON_DOWN, buttonDown );
			this.ouyaController.addEventListener( OUYAControllerANEEvent.BUTTON_UP, buttonUp );
			this.ouyaController.addEventListener( OUYAControllerANEEvent.LEFT_STICK_X, leftStick );
			this.ouyaController.addEventListener( OUYAControllerANEEvent.LEFT_STICK_Y, leftStick );
		}
		
		private function buttonDown( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Button Down" );
			if( this.ouyaController.button_O )
			{
				trace( "Button O Pressed" );
			}
		}
		
		private function buttonUp( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Button Up" );
		}
		
		private function leftStick( ouyaEvent:OUYAControllerANEEvent ):void
		{
			trace( "Left Stick: " + this.ouyaController.leftStickX + ", " + this.ouyaController.leftStickY );
		}
	}
}