@echo off
set mm=%date:~5,2%
set dd=%date:~8,2%
set time00=%time: =0%
set hh=%time00:~0,2%
set mn=%time00:~3,2%
set ss=%time00:~6,2%

@echo on
cd /d %~dp0
set filename=%mm%%dd%_%hh%%mn%_%ss%_IPaddress-state
echo IPaddress-state result>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ipconfig>>%filename%.txt
