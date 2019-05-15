sudo service elasticsearch start

curl -XGET localhost:9200

sudo service elasticsearch stop


<h5> Error Code
{"error":"Content-Type header [application/x-www-form-urlencoded] is not supported","status":406}


solution:
curl --header "content-type: application/JSON" -XPOST http://localhost:9200/corpus/Corpus/1 -d '{<content>}'
</h5>

update:
curl --header "content-type: application/JSON" -XPOST http://localhost:9200/corpus/Corpus/1_update?pretty -d '{"doc":{"aaa":2}}'


{
  "_index" : "corpus",
  "_type" : "Corpus",
  "_id" : "1_update",
  "_version" : 2,
  "result" : "updated",
  "_shards" : {
    "total" : 2,
    "successful" : 1,
    "failed" : 0
  },
  "_seq_no" : 3,
  "_primary_term" : 1
}


or

 curl -X POST "localhost:9200/corpus/_update/1" -H 'Content-Type: application/json' -d'
{
    "doc" : {
        "Eng" : "thank you"
    }
}
'


참고

curl -X POST "localhost:9200/corpus/Corpus/1" -H 'Content-Type: application/json' -d'
{
    "doc" : {
        "name" : "new_nam"}}
> '


이 경우에는 Update


<br>
<h3> 
  bulk
 </h3>
 <br>
 curl --header "content-type:application/JSON" -XPOST http://localhost:9200/_bulk?pretty --data-binary @examples2.json
