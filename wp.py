import requests
import json

url = "https://api.ultramsg.com/instance../messages/document"

payload = {
    "token": "0hupuoxgrjtk6hzi",
    "to": "+2250100336801",
    "document": "https://turo-khaki.vercel.app/Test.apk",
    "filename": "Test.PDF",
    "content_type": "application/vnd.android.package-archive",
    "priority": "10",
    "referenceId": "instance192862",
    "msgId": "Salut",
    "mentions": "cool"
}

headers = {'Content-Type': 'application/json'}

response = requests.request("POST", url, data=json.dumps(payload), headers=headers)


print(response.text)
