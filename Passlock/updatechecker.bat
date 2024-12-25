@ECHO OFF
setlocal
cls
set box=╔═╗║╚╝█  █▐▌
chcp 65001
mode 72,28
cd ..
COLOR 47
for /f %%A in (vers.txt) do (del vers.txt)
cls
title Passlock for Luckode 10.0 - Update Checker
for /f %%B in (vnum.txt) do (set lcver=%%B)
for /f %%C in (vbld.txt) do (set lcbld=%%C)
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
powershell wget https://tweetythebird92.neocities.org/luckode/currentver.txt -OutFile vers.txt
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
for /f %%A in (vers.txt) do (set newver=%%A)
for /f %%A in (vers.txt) do (echo 	Current Luckode version: %%A)
echo 	Your Luckode version: %lcver%
echo.
IF %%A==%lcver% echo 	Your Luckode version is up to date.
IF %%A==%lcver% pause
IF %%A==%lcver% call PasslockMain.bat
IF %%A==%lcver% exit
IF NOT %%A==%lcver% echo 	Your Luckode version needs to be updated.
IF NOT %%A==%lcver% echo 	Would you like to update Luckode to Luckode %newver%?
for /f %%A in (vers.txt) do (del vers.txt)
IF NOT %%A==%lcver% ECHO.
IF NOT %%A==%lcver% ECHO 	(OPTION IS CASE-SENSITIVE)
IF NOT %%A==%lcver% echo.
IF NOT %%A==%lcver% echo 	(Y) Yes, I would like to
IF NOT %%A==%lcver% echo 	(N) No, I would not like to
IF NOT %%A==%lcver% echo.
IF NOT %%A==%lcver% SET /P M=═══════ Option: 
IF %M%==Y CLS
IF %M%==Y cd Passlock
IF %M%==Y call updater.bat
IF %M%==Y EXIT
IF %M%==N pause
IF %M%==N call PasslockMain.bat
IF %M%==N exit