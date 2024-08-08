from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

# Carregar variáveis de ambiente do arquivo .env
load_dotenv()

DATABASE_URL = os.getenv("DATABASE_URL")
engine = create_engine(DATABASE_URL)

try:
    with engine.connect() as connection:
        print("Connection to the database was successful!")
except Exception as e:
    print(f"Failed to connect to the database: {e}")
