@echo off

:: =========================================================
:: SISTEMA: FARMACIA HOSPITALARIA
:: RESPALDO AUTOMATIZADO NoSQL (MongoDB)
:: BASE DE DATOS: hospital_farmacia
:: =========================================================

:: ---------------------------------------------------------
:: JUSTIFICACIÓN DEL RESPALDO AUTOMATIZADO:
:: Este script garantiza la generación automática de respaldos
:: de la base de datos hospital_farmacia, la cual contiene
:: información crítica del sistema hospitalario como:
:: - Inventario de medicamentos
:: - Dispensaciones
:: - Compras
:: - Bitácora de auditoría
::
:: Su automatización reduce errores humanos, asegura la
:: continuidad operativa del sistema y permite la recuperación
:: inmediata de datos ante fallos del sistema o pérdida de
:: información.
:: ---------------------------------------------------------

set DB=hospital_farmacia
set BACKUP_PATH=C:\Users\HP\Downloads\backups_mongo
set DATE=%date:~-4%-%date:~3,2%-%date:~0,2%

echo =========================================================
echo INICIANDO RESPALDO AUTOMATIZADO DE MONGODB
echo Base de datos: %DB%
echo Fecha: %DATE%
echo =========================================================

mongodump --uri="mongodb://localhost:27017/%DB%" --out="%BACKUP_PATH%\backup_%DATE%"

echo =========================================================
echo RESPALDO COMPLETADO EXITOSAMENTE
echo Ubicacion: %BACKUP_PATH%\backup_%DATE%
echo =========================================================

pause