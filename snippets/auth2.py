import os
import json
import requests


azure_client_id = os.environ['CLIENT_ID']
azure_secret = os.environ['CLIENT_SECRET']
azure_tenant = os.environ['TENANT_ID']

# authorize with azure
url = "https://login.windows.net/" + azure_tenant + "/oauth2/token"
data = "resource=https%3A%2F%2Fmanagement.core.windows.net%2F&client_id=" + azure_client_id + "&grant_type=client_credentials&client_secret=" + azure_secret
headers = {'Content-Type': 'application/x-www-form-urlencoded'}
response = requests.post(url, data=data, headers=headers)
token = response.json()["access_token"]


headers = {'Authorization': 'Bearer ' + token, 'Content-Type': 'application/json'}
params = {'api-version': '2016-06-01'}

url = 'https://management.azure.com/' + 'subscriptions'

r = requests.get(url, headers=headers, params=params)
print(json.dumps(r.json(), indent=4, separators=(',', ': ')))

