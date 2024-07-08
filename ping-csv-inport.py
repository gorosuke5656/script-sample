import csv
import subprocess

def ping(ip_address):
    try:
        # Windowsでpingコマンドを実行
        output = subprocess.check_output(['ping', '-n', '4', ip_address], universal_newlines=True)
        print(output)
    except subprocess.CalledProcessError as e:
        print(f"Ping to {ip_address} failed: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")
# pingリストのcsvを読み込む
# 読み込む形式(例）
# ip_address,
# 8.8.8.8,
# 1.1.1.1,
def read_ip_addresses_from_csv(file_path):
    ip_addresses = []
    try:
        with open(file_path, newline='') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                ip_addresses.append(row['ip_address'])
    except Exception as e:
        print(f"Failed to read CSV file: {e}")
    return ip_addresses

if __name__ == "__main__":
    csv_file_path = input("Enter the path to the CSV file: ")
    ip_addresses = read_ip_addresses_from_csv(csv_file_path)
    for ip_address in ip_addresses:
        ping(ip_address)
