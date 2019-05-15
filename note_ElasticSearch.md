sudo service elasticsearch start

curl -XGET localhost:9200

sudo service elasticsearch stop


<h5> Error Code
{"error":"Content-Type header [application/x-www-form-urlencoded] is not supported","status":406}

solution:
curl --header "content-type: application/JSON" -XPOST http://localhost:9200/corpus/Corpus/1 -d '{<content>}'
</h5>
