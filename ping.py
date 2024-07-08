import subprocess

hosts = ["8.8.8.8"]

for host in hosts:
    res = subprocess.run(["ping",host,"-n","4", "-w", "300"],stdout=subprocess.PIPE)

    print(res.stdout.decode("cp932"))
    
    if res.returncode == 0 :
        print("成功\n\n")
    else:
        print("失敗\n\n")
    print("-----------------------------")