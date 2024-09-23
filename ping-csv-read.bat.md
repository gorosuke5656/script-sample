１ 読み込むCSVファイルの作成<br>

（例）<br>
ip_addresses.csv<br>
192.168.1.1<br>
192.168.1.2<br>
192.168.1.3<br>

２　バッチファイルの作成<br>
forコマンドを使ってCSVファイルからIPアドレスを読み込み、各アドレスに対してpingコマンドを実行します。<br>

バッチファイル本体<br>
＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿<br>

@echo off<br>
setlocal enabledelayedexpansion<br>

REM CSVファイルのパスを指定<br>
set "csv_file=ip_addresses.csv"<br>

REM CSVファイルを1行ずつ読み込む<br>
for /f "tokens=1 delims=," %%a in (%csv_file%) do (<br>
    REM IPアドレスを変数にセット<br>
    set "ip_address=%%a"<br>
    
    REM IPアドレスに対してpingを送信<br>
    echo Pinging !ip_address! ...<br>
    ping -n 4 !ip_address!<br>
    
    REM Pingの結果をファイルに保存したい場合<br>
    REM ping -n 4 !ip_address! >> ping_results.txt<br>
)<br>

echo 完了しました。<br>
pause<br>

＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿＿<br>




説明

@echo off<br>
setlocal enabledelayedexpansion　の意味<br>


@echo off と setlocal enabledelayedexpansion はバッチファイルの制御に使われる重要なコマンドです。それぞれの意味を解説します。<br>
@echo off<br>

    説明: このコマンドはバッチファイルの実行中に、実行されるコマンド自体を画面に表示しないようにするためのものです。<br>
        デフォルトでは、バッチファイルは実行される各コマンドを標準出力（コンソール）に表示します。これを抑制するために使われます。<br>
        @ をつけることで、その行（echo off）自体のコマンド表示も抑制します。<br>

例：
@echo off<br>
echo Hello, World!<br>

    この場合、echo Hello, World! のコマンドは表示されず、結果の「Hello, World!」だけが表示されます。<br>

setlocal enabledelayedexpansion<br>

    説明: このコマンドは、「遅延環境変数展開（Delayed Variable Expansion）」を有効にします。遅延環境変数展開は、ループ内で環境変数をリアルタイムで更新・使用する必要がある場合に重要です。<br>

    通常の環境変数は、ループが始まる前に展開されますが、enabledelayedexpansion を有効にすると、!var! の形式で書かれた変数がループ中でも最新の値で展開されます。これはループ内で変数が動的に更新される場合に必要です。<br>


    @echo off: バッチファイルの実行コマンド自体を表示しないようにします。<br>
    setlocal enabledelayedexpansion: ループや他の構造内で動的に更新される変数をリアルタイムに利用するために使います<br>。




    for /f：CSVファイルの各行を読み込みます。delims=,でカンマ区切りを指定しています（もしIPアドレスだけが入っている場合はそのままで大丈夫です）。<br>
    ping -n 4：各IPアドレスに対して4回pingを送信します。必要に応じて回数を変更してください。<br>
    !ip_address!：遅延展開されたIPアドレスの値です。<br>



3. 実行方法<br>

    上記のスクリプトをテキストエディタ（例：メモ帳）にコピーし、ping_script.batとして保存します。<br>
    同じフォルダにip_addresses.csvを配置します。<br>
    ping_script.batをダブルクリックして実行します。<br>

