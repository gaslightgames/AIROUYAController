package com.gaslightgames.android.ouyacontrollerane.extensions;

import tv.ouya.console.api.OuyaController;

import com.adobe.fre.FREContext;

import android.view.KeyEvent;
import android.view.View;

public class OUYAControllerANEKeyListener implements View.OnKeyListener
{

	OUYAControllerANEExtensionContext ouyaExtensionContext;
	OuyaController controller;
	
	public OUYAControllerANEKeyListener( FREContext context )
	{
		this.ouyaExtensionContext = (OUYAControllerANEExtensionContext)context;
	}
	
	@Override
	public boolean onKey( View view, int keyCode, KeyEvent keyEvent )
	{
		if( KeyEvent.ACTION_DOWN == keyEvent.getAction() )
		{
			// Allow the OuyaController class to handle the event - this means we can check which player
			// pressed which button/axis.
			OuyaController.onKeyDown( keyCode, keyEvent );
			
			//controller = OuyaController.getControllerByDeviceId( keyEvent.getDeviceId() );
			
			//this.ouyaExtensionContext.notifyButtonDown( controller.getPlayerNum(), keyCode );
			this.ouyaExtensionContext.notifyButtonDown( OuyaController.getPlayerNumByDeviceId( keyEvent.getDeviceId() ), keyCode );
		}
		else
		{
			// Allow the OuyaController class to handle the event - this means we can check which player
			// pressed which button/axis.
			OuyaController.onKeyUp( keyCode, keyEvent );
			
			//controller = OuyaController.getControllerByDeviceId( keyEvent.getDeviceId() );
			
			//this.ouyaExtensionContext.notifyButtonUp( controller.getPlayerNum(), keyCode );
			this.ouyaExtensionContext.notifyButtonUp( OuyaController.getPlayerNumByDeviceId( keyEvent.getDeviceId() ), keyCode );
		}
		
		return true;
	}
}
