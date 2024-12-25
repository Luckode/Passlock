@ECHO OFF
setlocal
cls
set box=╔═╗║╚╝█  █▐▌
chcp 65001
mode 72,28
cd ..
COLOR 47
cls
title Passlock for Luckode 10.0 - Updater
for /f %%B in (vnum.txt) do (set lcver=%%B)
for /f %%C in (vbld.txt) do (set lcbld=%%C)
set plbld=22-Dec-24
taskkill /f /im Luckode.exe
cls

:banner
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
:options
ECHO 	Once you update, you can NOT reverse it via. this tool.
ECHO 	Are you sure you want to update?
ECHO.
ECHO 	(OPTION IS CASE-SENSITIVE)
ECHO.
ECHO		(Y) I would like to continue
ECHO		(N) I would like to cancel the update
ECHO.
:choose
SET /P M=═══════ Option: 
:update
IF %M%==Y echo Please wait, fetching contents online...
IF %M%==Y powershell wget "https://luckode.nekoweb.org/Recovery/RecentVersion/Luckode.exe" -OutFile vm.exe
IF %M%==Y echo VM copied.
IF %M%==Y echo Please wait, fetching contents online...
IF %M%==Y powershell wget "https://luckode.nekoweb.org/Recovery/RecentVersion/Luckode.image" -OutFile img.image
IF %M%==Y echo IMAGE copied.
IF %M%==Y echo Please wait, fetching contents online...
IF %M%==Y powershell wget "https://luckode.nekoweb.org/Recovery/RecentVersion/splash.bmp" -OutFile bmp.bmp
IF %M%==Y echo SPLASH copied.
IF %M%==Y echo Please wait, fetching contents online...
IF %M%==Y powershell wget "https://luckode.nekoweb.org/Recovery/RecentVersion/Licenses.rtf" -OutFile lic.rtf
IF %M%==Y echo LICENSES copied.
IF %M%==Y echo Please wait, fetching contents online...
IF %M%==Y powershell wget "https://luckode.nekoweb.org/Recovery/RecentVersion/vnum.txt" -OutFile ver.txt
IF %M%==Y echo LUCKODE VERSION FILE copied.
IF %M%==Y echo Please wait, fetching contents online...
IF %M%==Y powershell wget "https://luckode.nekoweb.org/Recovery/RecentVersion/vbld.txt" -OutFile bld.txt
IF %M%==Y echo LUCKODE BUILD FILE copied.
rem ------------------------------------------
IF %M%==Y if exist vm.exe del Luckode.exe
IF %M%==Y if exist img.image del Luckode.image
IF %M%==Y if exist bmp.bmp del splash.bmp
IF %M%==Y if exist lic.rtf del Licenses.rtf
IF %M%==Y if exist ver.txt del vnum.txt
IF %M%==Y if exist bld.txt del vbld.txt
rem ------------------------------------------
IF %M%==Y if exist vm.exe ren vm.exe Luckode.exe
IF %M%==Y if exist img.image ren img.image Luckode.image
IF %M%==Y if exist bmp.bmp ren bmp.bmp splash.bmp
IF %M%==Y if exist lic.rtf ren lic.rtf Licenses.rtf
IF %M%==Y if exist ver.txt ren ver.txt vnum.txt
IF %M%==Y if exist bld.txt ren bld.txt vbld.txt
IF %M%==Y echo 	Luckode update complete.
IF %M%==Y echo 	Use the Passlock updater to update Passlock.
IF %M%==Y pause
call PasslockMain.bat