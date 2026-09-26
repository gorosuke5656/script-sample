$ip = Read-Host "Enter IPv4 address"

Write-Host "Traceroute target: $ip"
Write-Host "Press Ctrl+C to stop"
Write-Host ""

while ($true) {
    Write-Host "========================================"
    Write-Host "$(Get-Date -Format 'HH:mm:ss.fff')  Traceroute to $ip"
    Write-Host "========================================"

    tracert.exe -d $ip

    Write-Host ""
    Start-Sleep -Seconds 1
}