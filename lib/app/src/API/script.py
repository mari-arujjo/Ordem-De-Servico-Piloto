import requests
import time

url = "https://api-ordem-de-servico-tfyb.onrender.com/api/OK"

while True:
    try:
        response = requests.get(url)
        print(f"Status Code: {response.status_code}, Response: {response.text}")
    except Exception as e:
        print(f"Erro ao acessar o endpoint: {e}")
    
    time.sleep(120)  # Espera 2 minutos (120 segundos)