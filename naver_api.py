import requests
import json
from bs4 import BeautifulSoup

url = "https://openapi.naver.com/v1/search/blog.json"

title = "파이썬"
params = {
    "query": title,
    "display": 100,
    "start": 1,
    "sort": "date"
}

headers = {
    "X-Naver-Client-Id": "XEIkDv0Pg4Q3mxlju6Mx",
    "X-Naver-Client-Secret": "5HJNNNG_Gg"
}

res = requests.get(url, params = params, headers = headers).text

jsonData = json.loads(res)

# print(json.dumps(jsonData, ensure_ascii=False, indent=2))

for item in jsonData['items']:
    print(item['title'].replace('</b>','').replace('<b>',''), item['bloggerlink'], item['bloggername'], item['postdate'])
