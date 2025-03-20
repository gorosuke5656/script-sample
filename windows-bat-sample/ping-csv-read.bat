@echo off
setlocal enabledelayedexpansion

REM CSVファイルのパスを指定
set "csv_file=ip_addresses.csv"

REM CSVファイルを1行ずつ読み込む
for /f "tokens=1 delims=," %%a in (%csv_file%) do (
    REM IPアドレスを変数にセット
    set "ip_address=%%a"
    
    REM IPアドレスに対してpingを送信
    echo Pinging !ip_address! ...
    ping -n 4 !ip_address!
    
    REM Pingの結果をファイルに保存したい場合
    REM ping -n 4 !ip_address! >> ping_results.txt
)

echo 完了しました。
pause