@echo off
setlocal enabledelayedexpansion

REM リストファイルの指定
set TARGET_FILE=targets.txt

REM リストファイルが存在するか確認
if not exist %TARGET_FILE% (
    echo Target file "%TARGET_FILE%" not found!
    exit /b 1
)

REM 結果ファイルの初期化
echo Connection Test Results > results.txt

REM リストを1行ずつ読み込んで処理
for /f "tokens=1,2" %%A in (%TARGET_FILE%) do (
    set IP_ADDRESS=%%A
    set PORT=%%B

    echo Checking connection to !IP_ADDRESS!:!PORT!...
    powershell -Command "Test-NetConnection -ComputerName !IP_ADDRESS! -Port !PORT! | Select-Object -ExpandProperty TcpTestSucceeded" > temp_result.txt

    for /F %%C in (temp_result.txt) do set RESULT=%%C
    del temp_result.txt

    if "!RESULT!" == "True" (
        echo [SUCCESS] !IP_ADDRESS!:!PORT! >> results.txt
        echo Connection successful to !IP_ADDRESS!:!PORT!
    ) else (
        echo [FAILED] !IP_ADDRESS!:!PORT! >> results.txt
        echo Connection failed to !IP_ADDRESS!:!PORT!
    )
)

REM 結果を表示
echo ====================================
echo Test completed. Results saved to results.txt
echo ====================================
type results.txt

exit /b 0