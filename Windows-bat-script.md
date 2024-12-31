出力したテキスト

@echo off<br>

   // @echo off を指定することで、
       echo off コマンド自体も表示せず、以降のコマンドも表示しなくなります。

set mm=%date:~5,2%
set dd=%date:~8,2%
set time00=%time: =0%
set hh=%time00:~0,2%
set mn=%time00:~3,2%
set ss=%time00:~6,2%

  //　現在の時刻情報を変数に格納（必要な文字のみ抽出）

set filename=%mm%%dd%_%hh%%mn%_%ss%_ファイル名
　//　現在の時刻を付加してファイル名を作成
 
echo -------------------------------------------------------------->>%filename%.txt
コマンド実行　>>%filename%.txt
　　　
