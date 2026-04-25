from sqlalchemy import Column, Integer, String, DateTime, Enum, SmallInteger
from app.config.database import Base
from datetime import datetime

class Medicamento(Base):
    __tablename__ = "tbc_ph_medicamentos"

    Id = Column(Integer, primary_key=True, autoincrement=True)
    Nombre = Column(String(150), nullable=False)
    Nombre_Cientifico = Column(String(150), nullable=False, default="")
    Nombre_Comun = Column(String(150), nullable=False, default="")
    Principio_Activo = Column(String(150), nullable=False, default="")
    Concentracion = Column(String(100), nullable=False, default="")
    Forma_Farmaceutica = Column(String(100), nullable=False, default="")
    Via_Administracion = Column(String(100), nullable=False, default="")
    Tipo_Medicamento = Column(Enum("normal", "controlado", "alto_costo"), nullable=False)
    Fecha_Registro = Column(DateTime, nullable=False, default=datetime.now)
    Estatus = Column(SmallInteger, nullable=False, default=1)
