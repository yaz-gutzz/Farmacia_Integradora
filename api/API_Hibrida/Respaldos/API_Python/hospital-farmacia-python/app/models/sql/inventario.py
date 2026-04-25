from sqlalchemy import Column, Integer, String, DateTime, Text, Boolean
from app.config.database import Base

class InventarioMedicamento(Base):
    __tablename__ = "tbd_ph_inventario_medicamentos"

    Id = Column(Integer, primary_key=True, autoincrement=True)
    Lote_Medicamento_Id = Column(Integer, nullable=False)
    Marca = Column(String(150), nullable=True)
    Empresa = Column(String(150), nullable=True)
    Farmaceutica = Column(String(150), nullable=True)
    Presentacion = Column(String(150), nullable=True)
    Via_Administracion = Column(String(150), nullable=True)
    Efectos_Secundarios = Column(Text, nullable=True)
    Restricciones = Column(Text, nullable=True)
    Cantidad = Column(Integer, default=0)
    Fecha_Registro = Column(DateTime, nullable=False)
    Fecha_Actualizacion = Column(DateTime, nullable=True)
    Estatus = Column(Boolean, default=True)
