import os
import secrets
from fastapi import Depends, HTTPException, status
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from dotenv import load_dotenv

load_dotenv()

security = HTTPBasic()

def verify_credentials(credentials: HTTPBasicCredentials = Depends(security)):
    """Valida usuario y contraseña con comparación segura (timing-safe)."""
    valid_user = os.getenv("API_USER", "admin")
    valid_pass = os.getenv("API_PASS", "1234")

    user_ok = secrets.compare_digest(credentials.username, valid_user)
    pass_ok = secrets.compare_digest(credentials.password, valid_pass)

    if not (user_ok and pass_ok):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Credenciales incorrectas. Use admin/1234",
            headers={"WWW-Authenticate": "Basic"},
        )
    return credentials.username
