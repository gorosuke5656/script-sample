@echo off
rem Pingの宛先IPアドレスを指定します。ここにPingを実行したいIPアドレスに書き換えてください。
set IPADDRESS=8.8.8.8
   
rem 結果を出力するファイル名を指定します。
set FILENAME=Ping結果.log
   
rem 処理で使う文言などを指定します。
set COMMAND=ping %IPADDRESS%
set PACKET=パケット数: 送信 = 4、受信 = 4、損失 = 0 (0%% の損失)、
set RESPONSE=からの応答
set OKMESSAGE=Ping○
set NGMESSAGE=Ping×(個別に結果を確認してください。)
set RESPONSE_RESULT=NG
set PACKET_RESULT=NG
   
rem デスクトップへ「Ping結果.log」のファイルを作成。ファイルへPingコマンドを書き込む。
echo %COMMAND% > Ping結果.log
   
rem Pingコマンドを実行して、デスクトップの「Ping結果.log」へ結果を書き込む。
%COMMAND% >> Ping結果.log
   
rem 「Ping結果.log」の内容を１行ずつ読み込む。
for /f "delims=" %%i in (%FILENAME%) do (
    rem 応答状況の行か判断する。
    echo "%%i" | find "%RESPONSE%" > NUL
    if not errorlevel 1 (
        rem 応答が宛先IPアドレスか判断する。
        echo "%%i" | find "%IPADDRESS%" > NUL
        if not errorlevel 1 (
            rem OKフラグを立てる。
            set RESPONSE_RESULT=OK
        )
    )
   
    rem 全てのパケットが応答しているか判断する。
    echo "%%i" | find "%PACKET%" > NUL
    if not errorlevel 1 (
        rem OKフラグを立てる。
        set PACKET_RESULT=OK
    )
)
   
rem 両方OKの場合にPing○を表示する。
if %RESPONSE_RESULT%==OK (
    if %PACKET_RESULT%==OK (
        rem コマンドプロンプトの画面に「Ping○」を表示
        echo Ping○
        rem 「:ENDBAT」に移動する。
        goto ENDBAT
    )
)
rem コマンドプロンプトの画面に「Ping×」を表示する。
echo Ping×
   
:ENDBAT
   
rem 「続行するには何かキーを押してください...」を表示して入力待ちにします。
pause