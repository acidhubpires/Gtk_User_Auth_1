from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

# Carregar variáveis de ambiente do arquivo .env
load_dotenv(dotenv_path='C:/Users/aaopi/Developer/Gtk_User_Auth_1/.env')

DATABASE_URL = os.getenv("DATABASE_URL")

if DATABASE_URL is None:
    print("DATABASE_URL is not set.")
else:
    print(f"Database URL: {DATABASE_URL}")

    try:
        engine = create_engine(DATABASE_URL)
        with engine.connect() as connection:
            print("Connection to the database was successful!")
    except Exception as e:
        print(f"Failed to connect to the database: {e}")
