from sqlalchemy import Column, Integer, String, DateTime
from app.config.database import Base

class BitacoraInsert(Base):
    """
    Modelo para registrar el uso de los endpoints en la bitácora.
    Estructura real de la tabla: ID, Nombre_Tabla, Usuario, Operacion, Descripcion, Fecha_Hora
    """
    __tablename__ = "tbi_bitacora"
    
    ID = Column(Integer, primary_key=True, index=True, autoincrement=True)
    Nombre_Tabla = Column(String(100), nullable=False)
    Usuario = Column(String(100), nullable=False)
    Operacion = Column(String(50), nullable=False)
    Descripcion = Column(String(500), nullable=True)
    Fecha_Hora = Column(DateTime, nullable=False)
