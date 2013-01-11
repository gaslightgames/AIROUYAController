package
{
	import com.gaslightgames.nativeExtensions.OUYAControllerANE.OUYAControllerANE;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	
	public class OUYAControllerANETest extends Sprite
	{
		private var _ouyaController:OUYAControllerANE
		private var _view:MovieClip;
		
		private static const CLIP_CONTROLLER_1:String = "controller1";
		private static const CLIP_CONTROLLER_2:String = "controller2";
		private static const CLIP_CONTROLLER_3:String = "controller3";
		private static const CLIP_CONTROLLER_4:String = "controller4";
		
		private var _controller1Controller:ControllerDisplayController;
		private var _controller2Controller:ControllerDisplayController;
		private var _controller3Controller:ControllerDisplayController;
		private var _controller4Controller:ControllerDisplayController;
		
		private var _controller1Player:ControllerPlayerController;
		private var _controller2Player:ControllerPlayerController;
		private var _controller3Player:ControllerPlayerController;
		private var _controller4Player:ControllerPlayerController;
		
		public function OUYAControllerANETest()
		{
			_view = new Assets();
			addChild(_view);
			_view.stop();
			
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			this.init();
		}
		
		private function init():void
		{
			_controller1Controller = new ControllerDisplayController(_view[CLIP_CONTROLLER_1]);
			_controller2Controller = new ControllerDisplayController(_view[CLIP_CONTROLLER_2]);
			_controller3Controller = new ControllerDisplayController(_view[CLIP_CONTROLLER_3]);
			_controller4Controller = new ControllerDisplayController(_view[CLIP_CONTROLLER_4]);
			
			_ouyaController = new OUYAControllerANE();
			
			_controller1Player = new ControllerPlayerController( _controller1Controller, _ouyaController.player1);
			_controller1Player = new ControllerPlayerController( _controller2Controller, _ouyaController.player2);
			_controller1Player = new ControllerPlayerController( _controller3Controller, _ouyaController.player3);
			_controller1Player = new ControllerPlayerController( _controller4Controller, _ouyaController.player4);
		}
	}
}