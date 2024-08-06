@echo off
SETLOCAL

echo Setting up AI Meeting Room project...

REM Caminho do PostgreSQL
set "PGSQL_PATH=C:\postgresql\pgsql\bin"

REM Caminho do projeto
set "PROJECT_PATH=C:\Users\aaopi\Developer\ai-meeting-room"

REM Variáveis do ambiente
set "DB_NAME=ai_meeting_room"
set "DB_USER=piresaao"
set "DB_PASSWORD=KiaraPanda220"
set "DB_HOST=localhost"
set "DB_PORT=5432"
set "DB_SUPERUSER=postgres"
set "DB_SUPERUSER_PASSWORD=kiarapanda"

REM Ativando o ambiente virtual
cd /d "%PROJECT_PATH%\backend"
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)
call venv\Scripts\activate

REM Instalando pacotes necessários
echo Installing required packages...
pip install -r requirements.txt

REM Configurando variáveis de ambiente
echo Setting up environment variables...
set "DATABASE_URL=postgresql://%DB_USER%:%DB_PASSWORD%@%DB_HOST%:%DB_PORT%/%DB_NAME%"
set "ENV_FILE=%PROJECT_PATH%\backend\.env"
echo DATABASE_URL=%DATABASE_URL% > %ENV_FILE%

REM Inicializando o banco de dados PostgreSQL
echo Initializing PostgreSQL database...
"%PGSQL_PATH%\psql" -U %DB_SUPERUSER% -c "CREATE DATABASE %DB_NAME%;" -h %DB_HOST% -p %DB_PORT%
"%PGSQL_PATH%\psql" -U %DB_SUPERUSER% -c "CREATE USER %DB_USER% WITH PASSWORD '%DB_PASSWORD';" -h %DB_HOST% -p %DB_PORT%
"%PGSQL_PATH%\psql" -U %DB_SUPERUSER% -c "GRANT ALL PRIVILEGES ON DATABASE %DB_NAME% TO %DB_USER%;" -h %DB_HOST% -p %DB_PORT%

REM Rodando as migrações do banco de dados (assumindo que você tenha um script de migração)
echo Running database migrations...
python app\init_db.py

REM Iniciando o servidor FastAPI
echo Starting FastAPI server...
uvicorn app.main:app --reload

ENDLOCAL
