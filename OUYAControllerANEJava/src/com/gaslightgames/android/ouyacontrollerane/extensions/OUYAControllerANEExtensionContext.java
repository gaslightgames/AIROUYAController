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
		}
		
		// Create an Event Name
		String eventName = "DOWN";
		
		if( 0 == player )
		{
			keyCodeStr = "1_" + keyCodeStr;
		}
		else if( 1 == player )
		{
			keyCodeStr = "2_" + keyCodeStr;
		}
		else if( 2 == player )
		{
			keyCodeStr = "3_" + keyCodeStr;
		}
		else if( 3 == player )
		{
			keyCodeStr = "4_" + keyCodeStr;
		}
		
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
		}
		
		if( 0 == player )
		{
			keyCodeStr = "1_" + keyCodeStr;
		}
		else if( 1 == player )
		{
			keyCodeStr = "2_" + keyCodeStr;
		}
		else if( 2 == player )
		{
			keyCodeStr = "3_" + keyCodeStr;
		}
		else if( 3 == player )
		{
			keyCodeStr = "4_" + keyCodeStr;
		}
		
		// Create an Event Name
		String eventName = "UP";
		
		dispatchStatusEventAsync( eventName, keyCodeStr );
	}
	
	public void notifyControllerLeftStick( int player, float x, float y )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String playerStr = "0_";
		String xValue = String.valueOf( x );
		String yValue = String.valueOf( y );
		
		if( 0 == player )
		{
			playerStr = "1_";
		}
		else if( 1 == player )
		{
			playerStr = "2_";
		}
		else if( 2 == player )
		{
			playerStr = "3_";
		}
		else if( 3 == player )
		{
			playerStr = "4_";
		}
		
		// Create an Event Name
		String eventName = "LEFTSTICK";
		
		dispatchStatusEventAsync( eventName, playerStr + xValue + "," + yValue );
	}
	
	public void notifyControllerRightStick( int player, float x, float y )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String playerStr = "0_";
		String xValue = String.valueOf( x );
		String yValue = String.valueOf( y );
		
		if( 0 == player )
		{
			playerStr = "1_";
		}
		else if( 1 == player )
		{
			playerStr = "2_";
		}
		else if( 2 == player )
		{
			playerStr = "3_";
		}
		else if( 3 == player )
		{
			playerStr = "4_";
		}
		
		// Create an Event Name
		String eventName = "RIGHTSTICK";
		
		dispatchStatusEventAsync( eventName, playerStr + xValue + "," + yValue );
	}
	
	public void notifyControllerLeftTrigger( int player, float value )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String analogueValue = String.valueOf( value );
		
		if( 0 == player )
		{
			analogueValue = "1_" + analogueValue;
		}
		else if( 1 == player )
		{
			analogueValue = "2_" + analogueValue;
		}
		else if( 2 == player )
		{
			analogueValue = "3_" + analogueValue;
		}
		else if( 3 == player )
		{
			analogueValue = "4_" + analogueValue;
		}
		
		// Create an Event Name
		String eventName = "LEFTTRIGGER";
		
		dispatchStatusEventAsync( eventName, analogueValue );
	}
	
	public void notifyControllerRightTrigger( int player, float value )
	{
		// Set the AnalogueValue as a String - so it can be passed to AS3
		String analogueValue = String.valueOf( value );
		
		if( 0 == player )
		{
			analogueValue = "1_" + analogueValue;
		}
		else if( 1 == player )
		{
			analogueValue = "2_" + analogueValue;
		}
		else if( 2 == player )
		{
			analogueValue = "3_" + analogueValue;
		}
		else if( 3 == player )
		{
			analogueValue = "4_" + analogueValue;
		}
		
		// Create an Event Name
		String eventName = "RIGHTTRIGGER";
		
		dispatchStatusEventAsync( eventName, analogueValue );
	}
	
	@Override
	public void dispose()
	{
		
	}

	@Override
	public Map<String, FREFunction> getFunctions()
	{
		Map<String, FREFunction> functionMap = new HashMap<String, FREFunction>();

		functionMap.put( "init", new OUYAControllerANEInit() );
		functionMap.put( "test", new OUYAControllerANETest() );

		return functionMap;
	}

}
