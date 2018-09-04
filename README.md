# Python-Devops
Try to cover pretty much we know.

## How-to Docker
Every folders contain .yml for docker-compose. You need to install Docker-Compose first.

To run,
```bash
compose/build
```

To access the bash, (open new terminal, compose/build must run)
```bash
compose/bash
```

To safely close
```bash
compose/down
```

To remove all images
```bash
docker rmi $(docker images -q)
```

To remove <none> images
```bash
docker rmi $(docker images -f “dangling=true” -q)
```

To remove all containers
```bash
docker rm $(docker ps -aq)
```

## Covered
1. Flask with Docker-compose
2. Flask and MongoDB with Docker-compose
3. Flask Rest API with Docker-compose
4. Flask + Rest API + Redis + PubSub with Docker-compose
5. Flask + MySQL + Rest API with Docker-compose
6. Flask + Elastic Search with Docker-compose
7. Jupyter notebook with Docker-compose
8. Jupyterhub with Docker-compose
9. Streaming Twitter + Elastic Search + Kibana
10. News Crawler + Luigi + Elastic Search + Kibana
11. Graph-dependencies

## How-to Request

#### Flask with Docker-compose

```text
curl localhost:5000/ -x GET

Hey, we have Flask in a Docker container!
```
```text
curl localhost:5000/members/husein/

husein
```

#### Flask with MongoDB

```text
curl localhost:5000/ -X GET

Hey, we have Flask with MongoDB in a Docker container!
```
```text
curl localhost:5000/insert?name=husein -X GET

done inserted husein
```
```text
curl localhost:5000/get?name=husein -X GET

husein
```
```text
curl localhost:5000/get?name=mike -X GET

not found
```

#### Flask Rest API

```text
curl localhost:5000 -X GET

{"hello": "world"}
```
```text
curl localhost:5000/todo1 -d "data=take milk" -X PUT
curl localhost:5000/todo1 -X GET

{"todo1": "take milk"}
```

#### Flask + Rest API + Redis + PubSub

```text
curl localhost:5000 -X GET

Hey, we have Flask with Redis in a Docker container!
```

```text
localhost:5000/first-channel -X GET

{"message": "Internal Server Error"}
```

```text
curl localhost:5000/first-channel -d "data=from first channel" -X PUT

"from first channel"

curl localhost:5000/first-channel -X GET

"from first channel"
```

```text
curl localhost:5000/fifth-channel -X GET

{"message": "Internal Server Error"}
```

#### Flask + MySQL + Rest API with Docker-compose

```text
curl localhost:5000/ -d "username=huseinzol05&first_name=husein&last_name=zolkepli&password=comel" -X PUT

"success {\"password\": \"comel\", \"first_name\": \"husein\", \"last_name\": \"zolkepli\", \"username\": \"huseinzol05\"}"

curl localhost:5000/ -d "username=huseinzol05" -X GET

"[10001, \"huseinzol05\", \"husein\", \"zolkepli\", \"comel\"]"
```

#### Flask + Postgres + Rest API with Docker-compose

```text
curl localhost:5000/ -d "username=huseinzol05&first_name=husein&last_name=zolkepli&pass=comel" -X PUT

"success {\"pass\": \"comel\", \"first_name\": \"husein\", \"last_name\": \"zolkepli\", \"username\": \"huseinzol05\"}"

curl localhost:5000/ -d "username=huseinzol05" -X GET

"[\"huseinzol05\", \"husein\", \"zolkepli\", \"comel\"]"
```

#### Flask + Elastic Search with Docker-compose

```text
curl localhost:9200/recipes/_search?q=title:salad -X GET

{"took":62,"timed_out":false,"_shards":{"total":1,"successful":1,"skipped":0,"failed":0},"hits":{"total":10,"max_score":0.054237623,"hits":[{"_index":"recipes","_type":"salads","_id":"LtlzD2UBBv9LAuM_3gMX","_score":0.054237623,"_source":{"ingredients": [{"step": "1/4 cup basil leaves"}, {"step": "4 cups 1/2-inch cubes watermelon"}, {"step": "2 teaspoons lemon juice"}, {"step": "1/4 teaspoon kosher salt"}, {"step": "1/4 teaspoon chili powder"}], "description": "A quick salad of watermelon and basil. The chili powder plays well with the sweetness of the melon.", "submitter": "Chefthompson.com", "title": "Watermelon Basil Salad", "calories": "10"}}
```

#### Streaming Twitter + Elastic Search + Kibana

Make sure you inserted related keys in twitter-streaming.py

```python
consumer_key=""
consumer_secret=""

access_token=""
access_token_secret=""
```

![alt text](sentiment-twitter-elasticsearch/kibana.png)

#### News Crawler + Luigi + Elastic Search + Kibana

Task automation

![alt text](luigi-crawler-sentiment-elasticsearch/dependency.png)

localhost:8082

![alt text](luigi-crawler-sentiment-elasticsearch/luigi.png)

Kibana

![alt text](luigi-crawler-sentiment-elasticsearch/kibana.png)

#### Graph-dependencies

```bash
cd graph-dependencies
python3 pyan.py malaya/*.py --colored --annotate --grouped --dot > malaya.dot
dot -Tsvg malaya.dot > malaya.svg
```

![alt text](graph-dependencies/malaya-graph.png)
