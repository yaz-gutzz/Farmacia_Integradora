from sqlalchemy import Column, Integer, String, Date, DateTime, Enum, Text, Boolean
from app.config.database import Base

class Lote(Base):
    __tablename__ = "tbd_ph_lotes_medicamentos"

    Id = Column(Integer, primary_key=True, autoincrement=True)
    Medicamento_Id = Column(Integer, nullable=False)
    Proveedor_Id = Column(Integer, nullable=True)
    Numero_Lote = Column(String(100), nullable=False)
    Fecha_Fabricacion = Column(Date, nullable=False)
    Fecha_Caducidad = Column(Date, nullable=False)
    Cantidad_Inicial = Column(Integer, nullable=False)
    Cantidad_Actual = Column(Integer, nullable=False)
    Estado_Lote = Column(Enum("Disponible", "Vencido"), nullable=False, default="Disponible")
    Observaciones = Column(Text, nullable=True)
    Fecha_Registro = Column(DateTime, nullable=False)
    Fecha_Actualizacion = Column(DateTime, nullable=True)
    Estatus = Column(Boolean, default=True)
