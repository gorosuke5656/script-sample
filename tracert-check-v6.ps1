$ip = Read-Host "Enter IPv6 address"
Write-Host "Traceroute target: $ip"
Write-Host "Press Ctrl+C to stop"
Write-Host ""

while ($true) {
    Write-Host "========================================"
    Write-Host "$(Get-Date -Format 'HH:mm:ss.fff')  Traceroute to $ip"
    Write-Host "========================================"

    tracert.exe -6 -d $ip

    Write-Host ""
    Start-Sleep -Seconds 1
}