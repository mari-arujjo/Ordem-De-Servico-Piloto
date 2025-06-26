import requests
import time

url = "https://api-ordem-de-servico-tfyb.onrender.com/api/usuario/16"

while True:
    try:
        response = requests.get(url)
        print(f"Status Code: {response.status_code}")
        print(f"Response: {response.text}")
    except Exception as e:
        print(f"Erro ao acessar o endpoint: {e}")
    
    time.sleep(60)

# pip install requests
# python script.py