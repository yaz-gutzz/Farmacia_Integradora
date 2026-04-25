import os
from dotenv import load_dotenv
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession, async_sessionmaker
from sqlalchemy.orm import DeclarativeBase
from motor.motor_asyncio import AsyncIOMotorClient

load_dotenv()

# ─── MySQL (SQLAlchemy async) ───────────────────────────────────────────────
MYSQL_URL = (
    f"mysql+aiomysql://{os.getenv('MYSQL_USER')}:{os.getenv('MYSQL_PASSWORD')}"
    f"@{os.getenv('MYSQL_HOST')}:{os.getenv('MYSQL_PORT')}/{os.getenv('MYSQL_DB')}"
)

engine = create_async_engine(MYSQL_URL, echo=False)
AsyncSessionLocal = async_sessionmaker(engine, expire_on_commit=False)

class Base(DeclarativeBase):
    pass

async def get_db():
    """Dependency: provee una sesión de SQLAlchemy por request."""
    async with AsyncSessionLocal() as session:
        yield session

# ─── MongoDB (Motor) ────────────────────────────────────────────────────────
MONGO_URI = os.getenv("MONGO_URI")
mongo_client = AsyncIOMotorClient(MONGO_URI)
mongo_db = mongo_client["hospital_farmacia"]

def get_mongo():
    return mongo_db
