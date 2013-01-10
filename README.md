AIROUYAController
=================

AIROUYAController is an unofficial Native Extension for Adobe AIR designed to expose the functionalities of the OUYA Controller to ActionScript 3.

This Extension is in HEAVY development, is constantly being updated and modified.  It is not exactly "stable" nor ready for commercial use.  Use with caution and be aware of problems, changes etc!

Folder Structure
================

There are 3 folders within the project:
1) OUYAControllerANEJava
The Native Java code.
2) OUYAControllerANELib
The ActionScript 3 Interface code.  Generates a SWC.
3) OUYAControllerANETest
A simple application that implements the ANE

Current Progress
================

All buttons work (except the OUYA Button - this is an outside case)
All Sticks work (some noise, in that 0.0 on the axis is sent often!)
Both Triggers work

To-Do
=====

* Build base ANE
* Include OuyaController library
* Extract .class files from OuyaController and embed into ANE (at JAR level)
* Send Events for Buttons
* Send Events for Thumbsticks
* Send Events for Triggers
* Create Repo on github
* Multiple Controller Support
* Touchpad Support
* ...?