import socket

def resolve_hostname(hostname):
    try:
        ip_address = socket.gethostbyname(hostname)
        print(f"The IP address of {hostname} is {ip_address}")
    except socket.gaierror as e:
        print(f"Failed to resolve {hostname}: {e}")

if __name__ == "__main__":
    hostname = input("Enter the hostname to resolve: ")
    resolve_hostname(hostname)
