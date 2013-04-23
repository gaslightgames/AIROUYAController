package com.gaslightgames.android.ouyacontrollerane.extensions;
import com.adobe.fre.FREContext;

import tv.ouya.console.api.OuyaController;
import android.view.MotionEvent;
import android.view.View;


public class OUYAControllerANEMotionListener implements View.OnGenericMotionListener
{

	OUYAControllerANEExtensionContext ouyaExtensionContext;
	OuyaController controller;
	
	float leftStickXOld 	= 0.0f;
	float leftStickYOld 	= 0.0f;
	float rightStickXOld 	= 0.0f;
	float rightStickYOld 	= 0.0f;
	
	float leftStickX 		= 0.0f;
	float leftStickY 		= 0.0f;
	float rightStickX 		= 0.0f;
	float rightStickY 		= 0.0f;
	
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
		
		if( MotionEvent.ACTION_HOVER_MOVE == event.getActionMasked() )
		{
			// TouchPad movement
			this.ouyaExtensionContext.notifyControllerTouchPad( event.getX(), event.getY() );//controller.getPlayerNum(), event.getX(), event.getY() );
		}
		else
		{
			// Thumbstick or Trigger move
			
			// Check if Left Thumbstick (Handles +ve and -ve		
			// Check if X Axis
			if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_LS_X ) )
			{
				this.leftStickX = event.getAxisValue( OuyaController.AXIS_LS_X );
			}
			else
			{
				this.leftStickX = 0.0f;
			}
			
			// Check if Y Axis
			if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_LS_Y ) )
			{
				this.leftStickY = event.getAxisValue( OuyaController.AXIS_LS_Y );
			}
			else
			{
				this.leftStickY = 0.0f;
			}
			
			if( this.leftStickXOld != this.leftStickX || this.leftStickYOld != this.leftStickY )
			{
				if( null != controller )
				{
					//this.ouyaExtensionContext.notifyControllerLeftStick( controller.getPlayerNum(), this.leftStickX, this.leftStickY );
					this.ouyaExtensionContext.notifyControllerLeftStick( OuyaController.getPlayerNumByDeviceId( event.getDeviceId() ), this.leftStickX, this.leftStickY );
				}
				this.leftStickXOld = this.leftStickX;
				this.leftStickYOld = this.leftStickY;
			}
			
			// Check if Right Thumbstick
			// Check if X Axis
			if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_RS_X ) )
			{
				this.rightStickX = event.getAxisValue( OuyaController.AXIS_RS_X );
			}
			else
			{
				this.rightStickX = 0.0f;
			}
			
			// Check if Y Axis
			if( -1.5258789E-5f != event.getAxisValue( OuyaController.AXIS_RS_Y ) )
			{
				this.rightStickY = event.getAxisValue( OuyaController.AXIS_RS_Y );
			}
			else
			{
				this.rightStickY = 0.0f;
			}
			
			if( this.rightStickXOld != this.rightStickX || this.rightStickYOld != this.rightStickY )
			{
				if( null != controller )
				{
					//this.ouyaExtensionContext.notifyControllerRightStick( controller.getPlayerNum(), this.rightStickX, this.rightStickY );
					this.ouyaExtensionContext.notifyControllerRightStick( OuyaController.getPlayerNumByDeviceId( event.getDeviceId() ), this.rightStickX, this.rightStickY );
				}
				this.rightStickXOld = this.rightStickX;
				this.rightStickYOld = this.rightStickY;
			}
			
			// Check if Left Trigger
			if( 0 < event.getAxisValue( OuyaController.AXIS_L2 ) )
			{
				//this.ouyaExtensionContext.notifyControllerLeftTrigger( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_L2 ) );
				this.ouyaExtensionContext.notifyControllerLeftTrigger( OuyaController.getPlayerNumByDeviceId( event.getDeviceId() ), event.getAxisValue( OuyaController.AXIS_L2 ) );
			}
			
			// Check if Right Trigger
			if( 0 < event.getAxisValue( OuyaController.AXIS_R2 ) )
			{
				//this.ouyaExtensionContext.notifyControllerRightTrigger( controller.getPlayerNum(), event.getAxisValue( OuyaController.AXIS_R2 ) );
				this.ouyaExtensionContext.notifyControllerRightTrigger( OuyaController.getPlayerNumByDeviceId( event.getDeviceId() ), event.getAxisValue( OuyaController.AXIS_R2 ) );
			}
		}
		return true;
	}

}
