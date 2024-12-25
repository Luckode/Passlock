@ECHO OFF
setlocal
cls
set box=╔═╗║╚╝█  █▐▌
chcp 65001
mode 72,28
cd ..
COLOR 47
for /f %%A in (pvers.txt) do (del pvers.txt)
cls
title Passlock for Luckode 10.0 - Update Checker
for /f %%B in (vnum.txt) do (set lcver=%%B)
for /f %%C in (vbld.txt) do (set lcbld=%%C)
set plver=2.0.0
set plbld=22-Dec-24

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
:about
echo 	Please wait, fetching contents online...
powershell wget https://tweetythebird92.neocities.org/luckode/currentpver.txt -OutFile pvers.txt
:result
cls
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
for /f %%A in (pvers.txt) do (set newver=%%A)
for /f %%A in (pvers.txt) do (echo 	Current Passlock version: %%A)
echo 	Your Passlock version: %plver%
echo.
IF %%A==%plver% echo 	Your Passlock version is up to date.
IF %%A==%plver% pause
IF %%A==%plver% call PasslockMain.bat
IF %%A==%plver% exit
IF NOT %%A==%plver% echo 	Your Passlock version needs to be updated.
IF NOT %%A==%plver% echo 	Would you like to update Passlock to Passlock %newver%?
for /f %%A in (pvers.txt) do (del pvers.txt)
IF NOT %%A==%plver% ECHO.
IF NOT %%A==%plver% ECHO 	(OPTION IS CASE-SENSITIVE)
IF NOT %%A==%plver% echo.
IF NOT %%A==%plver% echo 	(Y) Yes, I would like to
IF NOT %%A==%plver% echo 	(N) No, I would not like to
IF NOT %%A==%plver% echo.
IF NOT %%A==%plver% SET /P M=═══════ Option: 
IF %M%==Y CLS
IF %M%==Y cd Passlock
IF %M%==Y cd Fallback
IF %M%==Y call pupdater.bat
IF %M%==Y EXIT
IF %M%==N pause
IF %M%==N call PasslockMain.bat
IF %M%==N exit