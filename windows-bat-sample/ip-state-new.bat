@echo off
set mm=%date:~5,2%
set dd=%date:~8,2%
set time00=%time: =0%
set hh=%time00:~0,2%
set mn=%time00:~3,2%
set ss=%time00:~6,2%

@echo on
cd /d %~dp0
set filename1=%mm%%dd%_%hh%%mn%_%ss%_IPaddress-status
set filename2=%mm%%dd%_%hh%%mn%_%ss%_GW-state-status
echo IPaddress-status result>>%filename1%.txt
echo -------------------------------------------------------------->>%filename1%.txt
ipconfig>>%filename1%.txt
echo GW-status-status>>%filename2%.txt
echo -------------------------------------------------------------->>%filename2%.txt
route print>>%filename2%.txt
