package com.gaslightgames.android.ouyacontrollerane.extensions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREFunction;
import com.adobe.fre.FREObject;

public class OUYAControllerANETest implements FREFunction
{

	@Override
	public FREObject call( FREContext context, FREObject[] args )
	{
		((OUYAControllerANEExtensionContext)context).notifyButtonDown( 0, 404 );
		
		return null;
	}

}
