# diagnostic_ssl.py

import ssl
import socket

def check_ssl():
    print("Verificando o suporte SSL no Python...")

    try:
        context = ssl.create_default_context()
        print(f"Versão do OpenSSL: {ssl.OPENSSL_VERSION}")
        
        with socket.create_connection(("www.google.com", 443)) as conn:
            with context.wrap_socket(conn, server_hostname="www.google.com") as ssock:
                print("Conexão SSL estabelecida com sucesso!")
                print(f"Ciphers suportados: {ssock.cipher()}")
    except Exception as e:
        print(f"Erro de SSL: {e}")

if __name__ == "__main__":
    check_ssl()
