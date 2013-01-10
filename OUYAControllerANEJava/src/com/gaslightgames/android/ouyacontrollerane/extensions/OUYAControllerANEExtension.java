package com.gaslightgames.android.ouyacontrollerane.extensions;

import com.adobe.fre.FREContext;
import com.adobe.fre.FREExtension;

public class OUYAControllerANEExtension implements FREExtension
{
	public static FREContext extensionContext;
	
	public FREContext createContext( String contextType )
	{
		// Return a new OUYAControllerANEExtensionContext
		return new OUYAControllerANEExtensionContext();
	}

	public void dispose()
	{
		
	}

	public void initialize()
	{
		
	}

}
