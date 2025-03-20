@echo off
set mm=%date:~5,2%
set dd=%date:~8,2%
set time00=%time: =0%
set hh=%time00:~0,2%
set mn=%time00:~3,2%
set ss=%time00:~6,2%

@echo on
cd /d %~dp0
set filename=%mm%%dd%_%hh%%mn%_%ss%_DNS-Web-check-result
@echo off
echo DNS-Web-check result>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo DNS result(A-IPv4) >>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo Destination(Wide.ad.jp-v4)-result>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
nslookup www.wide.ad.jp 1.1.1.1>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo DNS result(AAAA-IPv4) >>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo Destination(Wide.ad.jp-v4-AAAA)-result>>%filename%.txt
nslookup -q=AAAA www.wide.ad.jp 1.1.1.1>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo DNS result(AAAA-IPv6) >>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo Destination(Wide.ad.jp-v6-AAAA)-result>>%filename%.txt
nslookup -q=AAAA www.wide.ad.jp 2606:4700:4700::1111>>%filename%.txt
echo curl result(ipv4.google-responcecode-only)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
curl -s -v -I http://ipv4.google.com>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo curl result(ipv6.google-responcecode-only)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
curl -s -v -I http://ipv6.google.com>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
start http://ipv4.google.com
start http://ipv6.google.com