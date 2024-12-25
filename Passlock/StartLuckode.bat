@ECHO OFF
setlocal
cls
set box=╔═╗║╚╝█  █▐▌
chcp 65001
mode 72,28
COLOR 17
cls
title Start Luckode
cd..

start Luckode.exe Luckode.image %1