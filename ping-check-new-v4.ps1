$ip = Read-Host "Enter IPv4 address"

Write-Host "Ping target: $ip"
Write-Host "Press Ctrl+C to stop"
Write-Host ""

while ($true) {
    $result = Test-Connection -ComputerName $ip -Count 1 -Quiet

    if ($result) {
        Write-Host "$(Get-Date -Format 'HH:mm:ss.fff')  $ip UP"
    }
    else {
        Write-Host "$(Get-Date -Format 'HH:mm:ss.fff')  $ip DOWN"
    }

    Start-Sleep -Milliseconds 100
}