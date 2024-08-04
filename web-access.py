import requests

# ユーザーにURLを入力させる
url = input("アクセスしたいURLを入力してください: ")

try:
    # 入力されたURLにGETリクエストを送信
    response = requests.get(url)
    
    # レスポンスのステータスコードを表示
    print(f"URLにアクセスしました。レスポンスコード: {response.status_code}")
    
except requests.exceptions.RequestException as e:
    # URLアクセスでエラーが発生した場合の処理
    print(f"エラーが発生しました: {e}")
