@echo off
set mm=%date:~5,2%
set dd=%date:~8,2%
set time00=%time: =0%
set hh=%time00:~0,2%
set mn=%time00:~3,2%
set ss=%time00:~6,2%

cd /d %~dp0
set filename=%mm%%dd%_%hh%%mn%_%ss%_PING-RESULT


:INPUT_START

SET IPV4ADD=
ECHO +-------------------------------------------------------+
SET /P IPV4ADD="IPV4�A�h���X����͂��Ă��������B"
ECHO +-------------------------------------------------------+

@echo off
echo Ping����>>%filename%.txt
ping -4 %IPV4ADD%>>%filename%.txt
echo result>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt

:INPUT_END
ECHO +-------------------------------------------------------+
ECHO  �������܂����B���ʂ�%mm%%dd%_%hh%%mn%_%ss%_PING-RESULT�ɂ���܂�
ECHO +-------------------------------------------------------+


PAUSE
EXIT
