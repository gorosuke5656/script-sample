
★出力したテキストを現在時刻+ファイル名で保存<br>

@echo off<br>
   // @echo off を指定することで、
       echo off コマンド自体も表示せず、以降のコマンドも表示しなくなります。
       
set mm=%date:~5,2%<br>
set dd=%date:~8,2%<br>
set time00=%time: =0%<br>
set hh=%time00:~0,2%<br>
set mn=%time00:~3,2%<br>
set ss=%time00:~6,2%<br>
  //　現在の時刻情報を変数に格納（必要な文字のみ抽出）

set filename=%mm%%dd%_%hh%%mn%_%ss%_ファイル名<br>
　//　現在の時刻を付加してファイル名を作成
 
echo -------------------------------------------------------------->>%filename%.txt<br>
コマンド実行　>>%filename%.txt<br>
　//　コマンド実行結果をファイルに出力<br>
　　　
