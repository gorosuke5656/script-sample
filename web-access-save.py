import requests

# ユーザーにアクセスしたいURLを入力させる
url = input("アクセスしたいURLを入力してください（例: https://example.com）: ")

# 保存するファイル名を指定
output_file = "web_response.txt"

try:
    # 入力されたURLにGETリクエストを送信
    response = requests.get(url)
    
    # レスポンスの内容を表示
    print(f"レスポンスコード: {response.status_code}")
    
    # レスポンスの内容をテキストファイルにUTF-8エンコーディングで保存
    with open(output_file, "w", encoding="utf-8") as file:
        file.write(f"URL: {url}\n")
        file.write(f"レスポンスコード: {response.status_code}\n")
        file.write("\nレスポンス内容:\n")
        file.write(response.text)
        
    print(f"レスポンス内容を '{output_file}' に保存しました。")
    
except requests.exceptions.RequestException as e:
    # エラーメッセージを表示してファイルに保存
    error_message = f"エラーが発生しました: {e}"
    print(error_message)
    
    with open(output_file, "w", encoding="utf-8") as file:
        file.write(error_message)
