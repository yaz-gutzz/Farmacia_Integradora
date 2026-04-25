@echo off
REM ============================================================
REM SCRIPT DE RESPALDO AUTOMATIZADO - MYSQL
REM ============================================================

REM ------------------------------------------------------------
REM JUSTIFICACIÓN:
REM
REM El presente script tiene como finalidad automatizar el
REM proceso de respaldo de la base de datos "hospital_matricula",
REM utilizando la herramienta mysqldump del sistema gestor MySQL.
REM
REM Se implementa mediante un archivo por lotes (.bat) en entorno
REM Windows, permitiendo su ejecución automática mediante el
REM programador de tareas del sistema operativo, con una
REM frecuencia diaria sin intervención manual.
REM
REM El script define parámetros como usuario (root), contraseña,
REM host (localhost), puerto (3307) y ruta de almacenamiento
REM (C:\Users\HP\Downloads), asegurando una conexión correcta al
REM servidor y la generación del respaldo en una ubicación segura.
REM
REM Se incorpora una variable dinámica de fecha en el nombre del
REM archivo, lo cual permite mantener un historial de respaldos
REM y evita la sobrescritura de información previa.
REM
REM El uso de mysqldump garantiza la creación de respaldos lógicos
REM completos, permitiendo la recuperación de la base de datos en
REM caso de fallos, pérdida de información o errores humanos.
REM
REM Este proceso contribuye a la integridad, disponibilidad y
REM seguridad de la información, siendo una práctica fundamental
REM en la administración de bases de datos.
REM ------------------------------------------------------------

REM ========================
REM CONFIGURACIÓN
REM ========================
set USER=root
set PASSWORD=1234
set DATABASE=hospital_matricula
set HOST=localhost
set PORT=3307
set BACKUP_PATH=C:\Users\HP\Downloads
set MYSQL_PATH="C:\Program Files\MySQL\MySQL Server 8.0\bin"

REM ========================
REM FECHA AUTOMÁTICA
REM ========================
set FECHA=%date:~10,4%-%date:~4,2%-%date:~7,2%

REM ========================
REM EJECUCIÓN DEL RESPALDO
REM ========================
%MYSQL_PATH%\mysqldump.exe -h %HOST% -P %PORT% -u %USER% -p%PASSWORD% %DATABASE% > %BACKUP_PATH%\backup_respaldo_automatizado_sql_%FECHA%.sql

REM ========================
REM CONFIRMACIÓN
REM ========================
echo ============================================
echo Respaldo generado correctamente:
echo %BACKUP_PATH%\backup_respaldo_automatizado_sql_%FECHA%.sql
echo ============================================

pause