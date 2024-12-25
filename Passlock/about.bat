@ECHO OFF
setlocal
cls
set box=╔═╗║╚╝█  █▐▌
chcp 65001
mode 72,28
cd ..
COLOR 17
cls
title Passlock for Luckode 10.0 - About
for /f %%B in (vnum.txt) do (set lcver=%%B)
for /f %%C in (vbld.txt) do (set lcbld=%%C)
set plbld=22-Dec-24

setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
endlocal

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
echo		Luckode is developed by TweetytheBird92 and Tweety
echo		Software, 2024-2025.
echo		The Luckode logo, clover, branding, Luckat, Nina, Tom,
echo		and Heather are owned by TweetytheBird92 and should be
echo		used with proper permissions.
echo		Passlock is owned by TweetytheBird92 and Tweety Software,
echo		2024-2025.
echo.
echo		Passlock version 2.0.0, build %plbld%
echo		Luckode version %lcver%, build %lcbld%
setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" set V=10/11
if "%version%" == "6.3" set V=8.1
if "%version%" == "6.2" set V=8.0
if "%version%" == "6.1" set V=7
if "%version%" == "6.0" set V=Vista
if "%version%" == "5.2" set V=XP (x64)
if "%version%" == "5.1" set V=XP (x86)
if "%version%" == "5.0" set V=2000
if "%version%" == "4.0" set V=NT 4.0
rem ---------------------------------------------------------------
echo		Running on Windows %v%
endlocal
echo.
pause
call PasslockMain.bat
exit