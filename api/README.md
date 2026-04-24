#  Manual de Instalación y Despliegue Local - API Híbrida (Farmacia/Hospital)

## 1. Descripción
Este proyecto es una API híbrida desarrollada con **FastAPI**, que integra **MySQL (SQL)** y **MongoDB (NoSQL)** para la gestión de un sistema de farmacia/hospital.

---

## 2. Requisitos previos
Antes de ejecutar el proyecto asegúrate de tener instalado:

- Python 3.10 o superior  
- MySQL Server  
- MongoDB Community Server  
- pip (gestor de paquetes de Python)

---

## 3. Clonar o descargar el proyecto

### Opción 1: Git
```bash
git clone <URL_DEL_REPOSITORIO>
cd API_Hibrida
```

### Opción 2: Descarga manual
- Descargar el ZIP del proyecto  
- Descomprimir en una carpeta local  

---

## 4. Crear entorno virtual

```bash
python -m venv venv
```

### Activar entorno en Windows:
```bash
venv\Scripts\activate
```

---

## 5. Instalación de dependencias

```bash
pip install -r requirements.txt
```

### Si no existe el archivo requirements:
```bash
pip install fastapi uvicorn sqlalchemy pymysql motor pymongo python-dotenv
```

---

## 6. Configuración del archivo .env

Crear un archivo llamado:

```
.env
```

### Ejemplo de configuración:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=hospital_farmacia

MONGO_URL=mongodb://localhost:27017
MONGO_DB=hospital_farmacia
```

---

## 7. Ejecución del servidor

```bash
uvicorn main:app --reload
```

---

## 8. Acceso al sistema

Una vez iniciado el servidor:

### 🌐 API principal
```
http://127.0.0.1:8000
```

### 📄 Documentación Swagger
```
http://127.0.0.1:8000/docs
```

### 📘 Redoc (alternativa)
```
http://127.0.0.1:8000/redoc
```

---

## 9. Notas importantes

- MySQL y MongoDB deben estar en ejecución antes de iniciar la API  
- El archivo `.env` es obligatorio para la conexión a bases de datos  
- Si hay errores de conexión, revisar credenciales y puertos (3306 y 27017)

---
---

## 10. Solución de errores frecuentes (FAQ)

###  1. Error: No se puede conectar a MySQL
**Posibles causas:**
- MySQL no está encendido
- Usuario o contraseña incorrectos en `.env`
- Puerto 3306 bloqueado

**Solución:**
- Iniciar MySQL Server
- Verificar credenciales en `.env`
- Revisar conexión en Workbench o Navicat

---

###  2. Error: MongoDB no conecta
**Posibles causas:**
- Servicio de MongoDB detenido
- URL incorrecta en `.env`

**Solución:**
- Iniciar MongoDB (`mongod`)
- Verificar:
```env
MONGO_URL=mongodb://localhost:27017
```

---

###  3. Error: "Module not found"
**Posibles causas:**
- No se instalaron dependencias
- Entorno virtual no activado

**Solución:**
```bash
venv\Scripts\activate
pip install -r requirements.txt
```

---

###  4. Error: Uvicorn no reconoce main
**Posibles causas:**
- Archivo principal no se llama `main.py`

**Solución:**
Ejecutar correctamente:
```bash
uvicorn main:app --reload
```

---

###  5. Swagger no carga
**Posibles causas:**
- El servidor no está corriendo

**Solución:**
Verificar que la API esté activa en:
```
http://127.0.0.1:8000
```

---

## 10. Recomendaciones

- Siempre iniciar primero MySQL y MongoDB antes de levantar la API  
- Usar entorno virtual para evitar conflictos de librerías  
- Mantener actualizado el archivo `.env`  
- Revisar logs de consola para detectar errores rápidos  

---