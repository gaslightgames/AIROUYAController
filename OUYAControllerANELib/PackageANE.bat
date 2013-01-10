set adt_directory=C:\Program Files\Adobe\Adobe Flash Builder 4.7 (64 Bit)\sdks\4.6.0\bin
set root_directory=D:\Gaslight Games\OUYA
set library_directory=%root_directory%\OUYAControllerANELib
set native_directory=%root_directory%\OUYAControllerANEJava
set signing_options=-storetype pkcs12 -keystore "D:\Gaslight Games\AIR_Certificates\GaslightGames2011.p12"
set dest_ANE=OUYAControllerANE.ane
set extension_XML=%library_directory%\src\extension.xml
set library_SWC=%library_directory%\bin\OUYAControllerANELib.swc
"%adt_directory%"\adt -package %signing_options% -target ane "%dest_ANE%" "%extension_XML%" -swc "%library_SWC%" -platform Android-ARM -C "%native_directory%" .