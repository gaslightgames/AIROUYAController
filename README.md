AIROUYAController
=================

AIROUYAController is an unofficial Native Extension for Adobe AIR designed to expose the functionalities of the OUYA Controller to ActionScript 3.
<BR>This project is most likely to be deprecated by the native AIR support for OUYA controllers coming in AIR3.7.  It will be updated in case any functionality is missing from the built in solution.

Folder Structure
================

There are 6 folders within the project:
<BR><B>1) OUYAControllerANEJava</B>
<BR>The Native Java code.
<BR><B>2) OUYAControllerANELib</B>
<BR>The ActionScript 3 Interface code.  Generates a SWC.
<BR><B>3) OUYAControllerANESimpleTest</B>
<BR>A simple application that implements the ANE.  This merely traces the button presses and axis to the console
<BR><B>4) OUYAControllerANETest</B>
<BR>A more comprehensive demo project with UI.
<BR><B>5) OUYAControllerANEDefaultLib</B>
<BR>Creates the "default" SWC.  This mimics the functionality of the ANE for unsupported platforms.
<BR><B>6) OUYAControllerWindowsTest</B>
<BR>Demonstrates that any AIR application can have the ANE attached, now that the default platform is included.

Current Progress
================

All buttons work (except the OUYA System/Home Button - this is an outside case)
<BR>Both Sticks work (some noise, in that 0.0 on the axis is sent often! - FIXED!)
<BR>Both Triggers work (work as buttons AND analogue triggers)
<BR>Touchpad works.

To-Do
=====

* Modify external class files that are included (to fix collisions with IAP ANE) [DONE]
* Make SWC Library a Singleton [DONE]
* Updated to ODK 1.0.3 [DONE]
* Support BUTTON_MENU [DONE]
* Fix calls to ODK for playerId [DONE]
* Build base ANE [DONE]
* Include OuyaController library [DONE]
* Extract .class files from OuyaController and embed into ANE (at JAR level) [DONE - must be done on ever new JAR!]
* Send Events for Buttons [DONE]
* Send Events for Thumbsticks [DONE]
* Send Events for Triggers [DONE]
* Create Repo on github [DONE]
* Multiple Controller Support [DONE]
* Touchpad Support [DONE - limitation: Touchpad acts as mouse, so the OuyaController has no "Player" value for whom used the trackpad]
* Fix Deadzone issue with Thumbsticks [DONE]
* Add OUYA Button [DONE - although we cannot intercept this!  The button support is in for when we may be able to find a workaround]
* Fix Thumbstick 0,0 Axis bug [DONE]
* Add more comprehensive and UI driven demonstration project [DONE - Thanks to Clayton!]
* Add isControllerSupported method [DONE - We use "isControllerSupported" instead of "isSupported" because if you use multiple ANEs and if these ANEs share any method names, whichever was the last loaded will use the name.]
* Add "default" platform [DONE - allows us to use the ANE in the same application for multiple platforms]