@Rem あらかじめパケット格納フォルダを作成しておく（今回はC:\Users\ユーザー\Desktop\pcap）

@echo off
whoami /priv | find "SeDebugPrivilege" > nul
if %errorlevel% neq 0 (
 @powershell start-process %~0 -verb runas
 exit
)

@echo on
@echo ネットワークインターフェイス一覧
"C:\Program Files\Wireshark\tshark.exe" -D

@Rem ネットワークインターフェイスを入力する
SET /P interface_id="キャプチャしたいインターフェイスを入力!!："

@Rem パケットの保存間隔を入力する
set /p time_duration="保存間隔(分)を入力!!："
set /a "time_duration *= 60"

@echo Wiresharkでパケットを保存します。終了させたい場合はCtrl+Cを押してください!!

"C:\Program Files\Wireshark\dumpcap.exe" -i %interface_id% -b duration:%time_duration% -w C:\Users\ユーザー\Desktop\pcap\packet.pcapng




pause

