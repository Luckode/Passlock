@echo OFF
setlocal
cls
set box=╔═╗║╚╝█  █▐▌
chcp 65001
mode 72,28
COLOR 17
cls
title Passlock for Luckode 10.0
for /f %%B in (vnum.txt) do (set lcver=%%B)
for /f %%C in (vbld.txt) do (set lcbld=%%C)
set plbld=22-Dec-24

call :banner
call :notice
call :options
call :choose

setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set %%v=%%i.%%j
endlocal

:banner
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
rem if %version% lss 6.1 echo POWERSHELL 3 NOT PACKAGED
if %version% geq 6.1 echo 	It appears you are running on a version of Windows where
if %version% geq 6.1 echo 	Powershell 3 or later versions aren't packaged. Some
if %version% geq 6.1 echo 	options may not work.
endlocal
echo.
echo		█████   ████    █████  █████ ██      ████   ████  ██  ██
echo		██  ██  ████   ██     ██     ██     ██  ██ ██  ██ ██ ██
echo		██  ██ ██  ██   ███    ███   ██     ██  ██ ██     ████
echo		█████  ██  ██     ██     ██  ██     ██  ██ ██     ██ ██
echo		██    ████████     ██     ██ ██     ██  ██ ██  ██ ██  ██
echo		██    ██    ██ █████  █████  ██████  ████   ████  ██  ██
echo.
echo		Multitool for Luckode %lcver% build %lcbld%
echo.
:notice
echo		Press the number corresponding to the option you want to
echo		execute.
echo		Options marked with (P3) require Powershell versions 3.0
echo		or higher.
:options
echo.
echo		(1) Start Luckode normally
echo		(2) Start Luckode in Developer Mode
echo		(3) Check for new Luckode version (P3)
rem echo		(4) Check for new Passlock version (P3)
echo		(4) Recover VM/Image (P3)
echo		(5) About Luckode and Passlock...
echo		(6) Exit
echo.
:choose
SET /P M=═══════ Option: 
IF %M%==1 CLS
IF %M%==1 start Luckode.exe Luckode.image %1
IF %M%==1 EXIT
IF %M%==2 CLS
IF %M%==2 start Luckode.exe Luckode.image %1 dev
IF %M%==2 EXIT
IF %M%==3 cd Passlock
IF %M%==3 CLS
IF %M%==3 call updatechecker.bat
IF %M%==3 EXIT
IF %M%==4 cd Passlock
IF %M%==4 CLS
IF %M%==4 call recover.bat
IF %M%==4 EXIT
IF %M%==5 cd Passlock
IF %M%==5 CLS
IF %M%==5 call about.bat
IF %M%==5 EXIT
IF %M%==6 CLS
IF %M%==6 EXIT