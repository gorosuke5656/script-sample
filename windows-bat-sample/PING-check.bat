@echo off
set mm=%date:~5,2%
set dd=%date:~8,2%
set time00=%time: =0%
set hh=%time00:~0,2%
set mn=%time00:~3,2%
set ss=%time00:~6,2%

@echo on
cd /d %~dp0
set filename=%mm%%dd%_%hh%%mn%_%ss%_PING-result
echo PING result>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo Ping result(IPv4) MTU1500>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo Destination(1.1.1.1)-result>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ping -4 -f -l 1472  -w 1 1.1.1.1>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo Ping result(IPv6) MTU1500>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo Destination(2606:4700:4700::1111)-result>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ping -6 -l 1452 -w 1 2606:4700:4700::1111>>%filename%.txt
