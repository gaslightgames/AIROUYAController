package com.gaslightgames.android.ouyacontrollerane.extensions;
import com.adobe.fre.FREContext;

import tv.ouya.console.api.OuyaController;
import android.view.MotionEvent;
import android.view.View;


public class OUYAControllerANEMotionListener implements View.OnGenericMotionListener
{

	OUYAControllerANEExtensionContext ouyaExtensionContext;
	OuyaController controller;
	
	public OUYAControllerANEMotionListener( FREContext context )
	{
		this.ouyaExtensionContext = (OUYAControllerANEExtensionContext)context;
	}
	
	@Override
	public boolean onGenericMotion( View v, MotionEvent event )
	{
		// -1.5258789E-5
		// THIS IS THE "NULL" VALUE!
		
		// Allow the OuyaController class to handle the event - this means we can check which player
		// pressed which button/axis.
		OuyaController.onGenericMotionEvent( event );
		
		controller = OuyaController.getControllerByDeviceId( event.getDeviceId() );
		
		// Check if Left Thumbstick (Handles +ve and -ve		
		// Check if X Axis
		if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_LS_X ) )
		{
			this.ouyaExtensionContext.notifyControllerLeftStickX( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_LS_X ) );
		}
		else
		{
			this.ouyaExtensionContext.notifyControllerLeftStickX( controller.getPlayerNum(), 0.0f );
		}
		
		// Check if Y Axis
		if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_LS_Y ) )
		{
			this.ouyaExtensionContext.notifyControllerLeftStickY( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_LS_Y ) );
		}
		else
		{
			this.ouyaExtensionContext.notifyControllerLeftStickY( controller.getPlayerNum(), 0.0f );
		}
		
		// Check if Right Thumbstick
		// Check if X Axis
		if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_RS_X ) )
		{
			this.ouyaExtensionContext.notifyControllerRightStickX( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_RS_X ) );
		}
		else
		{
			this.ouyaExtensionContext.notifyControllerRightStickX( controller.getPlayerNum(), 0.0f );
		}
		
		// Check if Y Axis
		if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_RS_Y ) )
		{
			this.ouyaExtensionContext.notifyControllerRightStickY( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_RS_Y ) );
		}
		else
		{
			this.ouyaExtensionContext.notifyControllerRightStickY( controller.getPlayerNum(), 0.0f );
		}
		
		// Check if Left Trigger
		if( 0 < event.getAxisValue( OuyaController.AXIS_L2 ) )
		{
			this.ouyaExtensionContext.notifyControllerLeftTrigger( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_L2 ) );
		}
		
		// Check if Right Trigger
		if( 0 < event.getAxisValue( OuyaController.AXIS_R2 ) )
		{
			this.ouyaExtensionContext.notifyControllerRightTrigger( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_R2 ) );
		}
		
		return true;
	}

}
