import subprocess


def ping(ip_address):
    try:
        # windowsでpingコマンドを実行
        output = subprocess.check_output(['ping', '-n', '4', ip_address], universal_newlines=True)
        print(output)
    except subprocess.CalledProcessError as e:
        print(f"ping to {ip_address} failed: {e}")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
        ip_address = input("Enter the IP address to ping: ")
        ping(ip_address)

        
