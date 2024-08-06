from app.database import Base, engine
from app.models import User  # Importe outros modelos conforme necessário

from app.database import Base, engine
from app.models import User  # Importe todos os modelos necessários

def init_db():
    Base.metadata.create_all(bind=engine)

if __name__ == "__main__":
    init_db()
