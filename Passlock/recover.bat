@ECHO OFF
setlocal
cls
set box=╔═╗║╚╝█  █▐▌
chcp 65001
mode 72,28
cd ..
COLOR 47
cls
title Passlock for Luckode 10.0 - Recovery
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
ECHO		(1) Recover Squeak Virtual Machine
ECHO		(2) Recover Luckode Image
ECHO		(3) Replace corrupted files
ECHO		(4) Go back to Passlock 2.0
ECHO		(5) Exit
:choose
SET /P M=═══════ Option: 
IF %M%==1 CLS
IF %M%==1 echo Please wait, fetching contents online...
IF %M%==1 powershell wget "https://luckode.nekoweb.org/Recovery/Luckode1000/LuckodeVM.exe" -OutFile vm.exe
IF %M%==1 echo VM copied.
IF %M%==2 CLS
IF %M%==2 echo Please wait, fetching contents online...
IF %M%==2 powershell wget "https://luckode.nekoweb.org/Recovery/Luckode1000/LuckodeIMG.image" -OutFile img.image
IF %M%==2 echo Image copied.
IF %M%==3 CLS
IF %M%==3 if exist vm.exe taskkill /f /im Luckode.exe
IF %M%==3 if exist vm.exe taskkill /f /im vm.exe
IF %M%==3 if exist vm.exe del Luckode.exe
IF %M%==3 if exist img.image del Luckode.image
IF %M%==3 if exist vm.exe ren vm.exe Luckode.exe
IF %M%==3 if exist img.image ren img.image Luckode.image
IF %M%==3 echo 	Replaced corrupted files.
IF %M%==3 pause
IF %M%==3 exit
IF %M%==4 CLS
IF %M%==4 REM cd ..
IF %M%==4 call PasslockMain.bat
IF %M%==5 exit
:corrupt
CLS
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
ECHO		What do you want to do with the corrupted files?
echo.
ECHO		(1) Replace the corrupt files automatically
ECHO		(2) Replace the corrupt files manually
ECHO		(3) Do nothing
SET /P C=═══════ Option: 
IF %C%==1 CLS
IF %C%==1 if exist vm.exe del Luckode.exe
IF %C%==1 if exist img.image del Luckode.image
IF %C%==1 if exist vm.exe ren vm.exe Luckode.exe
IF %C%==1 if exist img.image ren img.image Luckode.image
IF %C%==1 echo 	Replaced corrupted files.
IF %C%==1 pause
IF %C%==2 CLS
IF %C%==2 echo.
IF %C%==2 echo 	To fix the corrupted files:
IF %C%==2 echo 	1. Delete the corrupted VM/Image.
IF %C%==2 echo 	2. Rename the recovered VM/Image to Luckode.(filetype).
IF %C%==2 echo 	NOTE: The VM's filetype is EXE, and the Image's
IF %C%==2 echo 	NOTE: filetype is IMAGE.
IF %C%==2 echo.
IF %C%==2 pause
call PasslockMain.bat