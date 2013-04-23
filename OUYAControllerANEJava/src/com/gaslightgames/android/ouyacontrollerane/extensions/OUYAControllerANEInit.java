package com.gaslightgames.android.ouyacontrollerane.extensions;

import tv.ouya.console.api.OuyaController;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class OUYAControllerANEInit implements FREFunction
{

	public FREObject call( FREContext context, FREObject[] passedArgs )
	{
		OuyaController.init( context.getActivity() );
		
		OUYAControllerANEKeyListener listener = new OUYAControllerANEKeyListener( context );
		OUYAControllerANEMotionListener motionListener = new OUYAControllerANEMotionListener( context );
		
		context.getActivity().getCurrentFocus().setOnKeyListener( listener );
		context.getActivity().getCurrentFocus().setOnGenericMotionListener( motionListener );
		
		return null;
	}

}
