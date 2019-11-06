@ECHO OFF
SETLOCAL

ECHO ASLR Enable / Diable Batch Script - Please run as admin
ECHO Once Disabled , binaries will be prone to Stack smashing and buffer overflow exploits
ECHO Regards Captain_Nemo
 
set /p Choice=Want to Enable or Disable ASLR? (e or d):%=%

if "%Choice%"=="e" goto :ENABLE
if "%Choice%"=="d" goto :DISABLE

:ENABLE
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d 1 /f
	goto :EOF
:DISABLE
	reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages"
	goto :EOF
