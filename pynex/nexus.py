import requests
import logging

nexus_url = 'http://nexus:8081'
auth = ('admin', 'admin123')
headers = { 'accept' : 'application/json'}

def get_users(path='/service/local/users'):
    response = requests.get(nexus_url + path, auth=auth, headers=headers)
    logging.info("Hello: ".format(response.status_code))
    return response.text
