import adal
import requests
import os
import json

tenant = os.environ['TENANT_ID']
authority_url = 'https://login.microsoftonline.com/' + tenant
client_id = os.environ['CLIENT_ID']
client_secret = os.environ['CLIENT_SECRET']
resource = 'https://management.azure.com/'

context = adal.AuthenticationContext(authority_url)
token = context.acquire_token_with_client_credentials(resource, client_id, client_secret)

headers = {'Authorization': 'Bearer ' + token['accessToken'], 'Content-Type': 'application/json'}
params = {'api-version': '2016-06-01'}

url = 'https://management.azure.com/' + 'subscriptions'

r = requests.get(url, headers=headers, params=params)
print(json.dumps(r.json(), indent=4, separators=(',', ': ')))
