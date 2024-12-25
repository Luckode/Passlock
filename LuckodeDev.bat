@ECHO OFF
setlocal
TITLE LUCKODE DEVELOPER MODE
CLS
COLOR 17
set timer=10
set lcver=9.2.0
set plver=1.0.1
ECHO:
ECHO L    U   U  CCC K  K  OO  DDD  EEEE
ECHO L    U   U C    KKK  O  O D  D EEE 
ECHO LLLL  UUU   CCC K  K  OO  DDD  EEEE %lcver%
ECHO Developer Mode for Luckode %lcver%
ECHO (build 6-Oct-24)
ECHO:
ECHO  OOO  PPP AAA SSS SSS L   OOO CCC K K
ECHO  O O  P P A A S   S   L   O O C   K K
ECHO OOOOO PPP A A SSS SSS L   O O C   KK
ECHO OPL1O P   AAA   S   S L   O O C   K K
ECHO OOOOO P   A A SSS SSS LLL OOO CCC K K %plver%
ECHO for Luckode %lcver%
ECHO:
ECHO Luckode is developed by TweetytheBird92, 2024.
ECHO For enquiries, please contact TweetytheBird92
ECHO on Twitter. (https://x.com/TweetytheBird92)
ECHO -----------------------------------------------
ECHO Starting Luckode with normal developer privileges.
start Luckode.exe Luckode.image %1 dev
ECHO This window will close in %timer% seconds.
Timeout /t %timer% /nobreak >nul
EXIT