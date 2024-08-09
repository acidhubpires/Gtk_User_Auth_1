@echo off
REM Ativação do ambiente virtual
echo Ativando o ambiente virtual...
call venv\Scripts\activate

REM Instalação das dependências
echo Instalando as dependências do Python...
pip install --upgrade pip
pip install -r backend/requirements.txt

REM Conexão com o banco de dados (opcional para verificar a conexão)
echo Testando a conexão com o banco de dados...
python backend/app/test_db_connection.py

REM Rodando o servidor de desenvolvimento
echo Iniciando o servidor de desenvolvimento Uvicorn...
uvicorn backend.app.main:app --reload

REM Fim do script
echo Ambiente de desenvolvimento configurado com sucesso!
pause
