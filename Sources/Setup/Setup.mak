.SUFFIXES: .wxs .wixobj

WIX=..\..\ext\wix
CANDLE=$(WIX)\candle.exe
LIGHT=$(WIX)\light.exe

!if "$(CFG)" == "Debug"
OutDir=..\..\Executable\bin_dbg
!elseif "$(CFG)" == "Release"
OutDir=..\..\Executable\bin
!endif

IntDir=..\..\Intermediate\$(CFG)\Setup

MSI=$(OutDir)\TouchFreeze.msi

all: makedirs Setup.mak $(MSI)

clean:
    @if exist $(IntDir) rmdir /Q /S $(IntDir)
    @if exist $(MSI)    del $(MSI)
    
makedirs: 
    @if not exist $(IntDir) mkdir $(IntDir)
    @if not exist $(OutDir) mkdir $(OutDir)

.wxs{$(IntDir)\}.wixobj: 
    $(CANDLE) -nologo -out $(IntDir)\ %s -dExecDir=$(OutDir) -dVERSION=1.1.0

$(MSI): $(IntDir)\Setup.wixobj $(IntDir)\Dialogs.wixobj $(OutDir)\TouchFreeze.exe $(OutDir)\TouchFreeze.dll
    $(LIGHT) -nologo -out $(MSI) $(IntDir)\Setup.wixobj $(IntDir)\Dialogs.wixobj
