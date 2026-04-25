from sqlalchemy import Column, Integer, String, DateTime, SmallInteger, Text
from app.config.database import Base

class RecetaMedica(Base):
    __tablename__ = "tbb_ph_recetas_medicas"

    Id = Column(Integer, primary_key=True, autoincrement=True)
    Paciente_Id = Column(Integer, nullable=False)
    Personal_Medico_Id = Column(Integer)
    Estado_Receta = Column(String(50))
    Fecha_Emision = Column(DateTime)
    Fecha_Registro = Column(DateTime)
    Estatus = Column(SmallInteger)

class DetalleReceta(Base):
    __tablename__ = "tbd_ph_detalle_receta"

    Id = Column(Integer, primary_key=True, autoincrement=True)
    Receta_Id = Column(Integer, nullable=False)
    Medicamento_Id = Column(Integer, nullable=False)
    Dosis = Column(String(100))
    Frecuencia = Column(String(100))
    Duracion = Column(String(100))
    Cantidad = Column(Integer)
    Indicaciones = Column(Text)
    Fecha_Registro = Column(DateTime)
    Fecha_Actualizacion = Column(DateTime)
