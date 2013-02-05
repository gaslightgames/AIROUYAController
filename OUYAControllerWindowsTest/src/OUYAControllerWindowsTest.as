package
{
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANE;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class OUYAControllerWindowsTest extends Sprite
	{
		private var ouyaController:OUYAControllerANE
		
		public function OUYAControllerWindowsTest()
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.init();
		}
		
		private function init():void
		{
			if( OUYAControllerANE.isSupported )
			{
				this.ouyaController = new OUYAControllerANE();
			}
			else
			{
				trace( "Controller Not Supported" );
			}
		}
	}
}