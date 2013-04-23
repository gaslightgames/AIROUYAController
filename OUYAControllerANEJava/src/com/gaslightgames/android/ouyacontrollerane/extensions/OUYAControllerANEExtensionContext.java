package com.gaslightgames.android.ouyacontrollerane.extensions;

import java.util.HashMap;
import java.util.Map;

import tv.ouya.console.api.OuyaController;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;

public class OUYAControllerANEExtensionContext extends FREContext
{	
	public void notifyButtonDown( int player, int keyCode )
	{
		String keyCodeStr = "0";
		// Translate all codes into something more meaningful
		
		switch( keyCode )
		{
		case OuyaController.BUTTON_L3:
			keyCodeStr = "3";
			break;
		case OuyaController.BUTTON_R3:
			keyCodeStr = "6";
			break;
		case OuyaController.BUTTON_DPAD_UP:
			keyCodeStr = "7";
			break;
		case OuyaController.BUTTON_DPAD_DOWN:
			keyCodeStr = "8";
			break;
		case OuyaController.BUTTON_DPAD_LEFT:
			keyCodeStr = "9";
			break;
		case OuyaController.BUTTON_DPAD_RIGHT:
			keyCodeStr = "10";
			break;
		case OuyaController.BUTTON_O:
			keyCodeStr = "11";
			break;
		case OuyaController.BUTTON_U:
			keyCodeStr = "12";
			break;
		case OuyaController.BUTTON_Y:
			keyCodeStr = "13";
			break;
		case OuyaController.BUTTON_A:
			keyCodeStr = "14";
			break;
		case OuyaController.BUTTON_L2:
			keyCodeStr = "15";
			break;
		case OuyaController.BUTTON_R2:
			keyCodeStr = "16";
			break;
		case OuyaController.BUTTON_L1:
			keyCodeStr = "17";
			break;
		case OuyaController.BUTTON_R1:
			keyCodeStr = "18";
			break;
		case OuyaController.BUTTON_MENU:
			keyCodeStr = "19";
			break;
		}
		
		// Create an Event Name
		String eventName = "DOWN";
		
		keyCodeStr = this.playerString( player ) + keyCodeStr;
		
		dispatchStatusEventAsync( eventName, keyCodeStr );
	}
	
	public void notifyButtonUp( int player, int keyCode )
	{
		String keyCodeStr = "0";
		// Translate all codes into something more meaningful
		switch( keyCode )
		{
		case OuyaController.BUTTON_L3:
			keyCodeStr = "3";
			break;
		case OuyaController.BUTTON_R3:
			keyCodeStr = "6";
			break;
		case OuyaController.BUTTON_DPAD_UP:
			keyCodeStr = "7";
			break;
		case OuyaController.BUTTON_DPAD_DOWN:
			keyCodeStr = "8";
			break;
		case OuyaController.BUTTON_DPAD_LEFT:
			keyCodeStr = "9";
			break;
		case OuyaController.BUTTON_DPAD_RIGHT:
			keyCodeStr = "10";
			break;
		case OuyaController.BUTTON_O:
			keyCodeStr = "11";
			break;
		case OuyaController.BUTTON_U:
			keyCodeStr = "12";
			break;
		case OuyaController.BUTTON_Y:
			keyCodeStr = "13";
			break;
		case OuyaController.BUTTON_A:
			keyCodeStr = "14";
			break;
		case OuyaController.BUTTON_L2:
			keyCodeStr = "15";
			break;
		case OuyaController.BUTTON_R2:
			keyCodeStr = "16";
			break;
		case OuyaController.BUTTON_L1:
			keyCodeStr = "17";
			break;
		case OuyaController.BUTTON_R1:
			keyCodeStr = "18";
			break;
		case OuyaController.BUTTON_MENU:
			keyCodeStr = "19";
			break;
		// CASE "20" Is the TOUCHPAD - but handled separately
		}
		
		keyCodeStr = this.playerString( player ) + keyCodeStr;
		
		// Create an Event Name
		String eventName = "UP";
		
		dispatchStatusEventAsync( eventName, keyCodeStr );
	}
	
	public void notifyControllerLeftStick( int player, float x, float y )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String xValue = String.valueOf( x );
		String yValue = String.valueOf( y );
		
		// Create an Event Name
		String eventName = "LEFTSTICK";
		
		dispatchStatusEventAsync( eventName, this.playerString( player ) + xValue + "," + yValue );
	}
	
	public void notifyControllerRightStick( int player, float x, float y )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String xValue = String.valueOf( x );
		String yValue = String.valueOf( y );
		
		// Create an Event Name
		String eventName = "RIGHTSTICK";
		
		dispatchStatusEventAsync( eventName, this.playerString( player ) + xValue + "," + yValue );
	}
	
	public void notifyControllerLeftTrigger( int player, float value )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String analogueValue = String.valueOf( value );
		
		analogueValue = this.playerString( player ) + analogueValue;
		
		// Create an Event Name
		String eventName = "LEFTTRIGGER";
		
		dispatchStatusEventAsync( eventName, analogueValue );
	}
	
	public void notifyControllerRightTrigger( int player, float value )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String analogueValue = String.valueOf( value );
		
		analogueValue = this.playerString( player ) + analogueValue;
		
		// Create an Event Name
		String eventName = "RIGHTTRIGGER";
		
		dispatchStatusEventAsync( eventName, analogueValue );
	}
	
	public void notifyControllerTouchPad( float x, float y )//int player, float x, float y )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String xValue = String.valueOf( x );
		String yValue = String.valueOf( y );
		
		// Create an Event Name
		String eventName = "TOUCHPAD";
		
		dispatchStatusEventAsync( eventName, "1_" + xValue + "," + yValue );// this.playerString( player ) + xValue + "," + yValue );
	}
	
	private String playerString( int player )
	{
		String returnString = "0_";
		
		if( 0 == player )
		{
			returnString = "1_";
		}
		else if( 1 == player )
		{
			returnString = "2_";
		}
		else if( 2 == player )
		{
			returnString = "3_";
		}
		else if( 3 == player )
		{
			returnString = "4_";
		}
		
		return returnString;
	}
	
	@Override
	public void dispose()
	{
		
	}

	@Override
	public Map<String, FREFunction> getFunctions()
	{
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();

		functionMap.put( "initController", new OUYAControllerANEInit() );
		functionMap.put( "testController", new OUYAControllerANETest() );
		functionMap.put( "isControllerSupported", new OUYAControllerANESupported() );

		return functionMap;
	}

}
