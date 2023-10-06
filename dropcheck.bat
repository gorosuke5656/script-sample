@echo off
set mm=%date:~5,2%
set dd=%date:~8,2%
set time00=%time: =0%
set hh=%time00:~0,2%
set mn=%time00:~3,2%
set ss=%time00:~6,2%

@echo on
cd /d %~dp0
cd log
set filename=%mm%%dd%_%hh%%mn%_%ss%_gorosuke
echo gorosuke result>>%filename%.txt
echo 1.1 IPアドレス確認>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ipconfig>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo;
echo 2.1 L2 GWの確認確認>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
route print>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo; 
echo 3.1 Ping確認(IPv4) MTU1500>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 宛先(1.1.1.1)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ping -4 -f -l 1472  -w 1 1.1.1.1>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 3.2 Ping確認(IPv6) MTU1500>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 宛先(2606:4700:4700::1111)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ping -6 -l 1452 -w 1 2606:4700:4700::1111>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 3.3 Ping確認(IPv4)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 宛先(1.1.1.1)-short>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ping -4 -f -w 1 1.1.1.1>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 3.4 Ping確認(IPv6)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 宛先(2606:4700:4700::1111)-short>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
ping -6 -w 1 2606:4700:4700::1111>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo; 
echo -------------------------------------------------------------->>%filename%.txt
echo 4.1 Tracceroute(IPv4)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
tracert -d -w 1 8.8.8.8>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 4.2 Tracceroute(IPv6)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
tracert -d -w 1 2001:4860:4860::8888>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo; 
echo -------------------------------------------------------------->>%filename%.txt
echo 5.1 DNS(IPv4)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
c:\nettool\dig\dig.exe +short www.wide.ad.jp>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 5.2 DNS(IPv6)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
c:\nettool\dig\dig.exe +short www.wide.ad.jp AAAA>>%filename%.txt
echo; 
echo -------------------------------------------------------------->>%filename%.txt
echo 6.1 HTTP(IPv4)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
curl -LI http://ipv4.google.com>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 6.2 HTTP(IPv6)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
curl -LI http://ipv6.google.com>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
echo 6.3 Security(eicar.com)>>%filename%.txt
echo -------------------------------------------------------------->>%filename%.txt
curl -v -H "Cache-Control: no-cache" http://www.eicar.org/download/eicar_com.zip>>%filename%.txt
type %filename%.txt
pause