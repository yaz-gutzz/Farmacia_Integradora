# Respaldo Automatizado MongoDB

## Qué es un Respaldo Automatizado

Un respaldo automatizado es un proceso que se ejecuta sin intervención manual para crear copias de seguridad de la base de datos MongoDB en intervalos regulares y predefinidos. Estos respaldos garantizan la disponibilidad de datos en caso de pérdida, corrupción o desastres.

## Horarios y Justificación

- **00:00 (Medianoche):** Respaldo completo diario. Se realiza en horario de menor carga del sistema para no afectar operaciones críticas.
- **06:00 (Mañana):** Respaldo incremental. Captura cambios después del turno nocturno.
- **12:00 (Mediodía):** Respaldo incremental. Captura cambios después del turno matutino.
- **18:00 (Tarde):** Respaldo incremental. Captura cambios después del turno vespertino.

## Implementación en Windows

### Script Batch (.bat)

Crea un archivo llamado `respaldo_mongodb.bat` en Windows:

```batch
@echo off
REM Respaldo Automatizado de MongoDB - Windows
REM Ejecutar mediante Task Scheduler de Windows

setlocal enabledelayedexpansion

REM Configuración
set MONGO_HOST=localhost
set MONGO_PORT=27017
set MONGO_DB=farmacia_db
set MONGO_USER=backup_user
set MONGO_PASSWORD=contraseña_segura
set BACKUP_PATH=C:\Respaldos\MongoDB
set TIMESTAMP=%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%

REM Crear carpeta de respaldos si no existe
if not exist "%BACKUP_PATH%" mkdir "%BACKUP_PATH%"

REM Ejecutar respaldo con mongodump
mongodump --host %MONGO_HOST%:%MONGO_PORT% --db %MONGO_DB% --username %MONGO_USER% --password %MONGO_PASSWORD% --out "%BACKUP_PATH%\farmacia_%TIMESTAMP%"

REM Registrar éxito
echo Respaldo completado: %date% %time% >> "%BACKUP_PATH%\log_respaldos.txt"

pause
```

## Pasos de Configuración

### Paso 1: Crear el Script
![Crear archivo batch](./imagenes/paso1_crear_batch.png)

### Paso 2: Configurar Task Scheduler
![Configurar Task Scheduler](./imagenes/paso2_task_scheduler.png)

### Paso 3: Programar Horarios
![Programar horarios](./imagenes/paso3_horarios.png)

## Documentación Completa

La documentación completa con configuración avanzada está disponible en formato PDF.

**[Ver Respaldo Automatizado en PDF](./respaldo_automatizado.pdf)**

---

**Última actualización:** Abril 2026
