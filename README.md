# Python-Devops
Try to cover pretty much we know, everything Dockerize!

## Covered
1. AutoPEP8
2. Graph-dependencies
3. Pytest Flask
4. Locust stress test
5. Flask basic
6. Flask and MongoDB
7. Flask Rest API
8. Flask + Rest API + Redis + PubSub
9. Flask + MySQL + Rest API
10. Flask + Elastic Search
11. Jupyter notebook
12. Jupyterhub
13. Streaming Twitter + Elastic Search + Kibana
14. News Crawler + Luigi + Elastic Search + Kibana
15. Flask SocketIO Scaling + Redis
16. Distributed Flask + Redis + Nginx load balancer
17. Distributed Flask SocketIO + Redis + Nginx load balancer

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
docker rmi $(docker images -f "dangling=true" -q)
```

To remove all containers
```bash
docker rm $(docker ps -aq)
```

## How-to Request

#### AutoPEP8

```bash
cd autopep8
autopep8 --in-place --aggressive --recursive .
```

#### Graph-dependencies

```bash
cd graph-dependencies
python3 pyan.py malaya/*.py --colored --annotate --grouped --dot > malaya.dot
dot -Tsvg malaya.dot > malaya.svg
```

![alt text](graph-dependencies/malaya.svg)

![alt text](graph-dependencies/malaya-graph.png)

#### Pytest Flask

```text
pytest_1  | Name                 Stmts   Miss  Cover
pytest_1  | ----------------------------------------
pytest_1  | web/__init__.py         13      2    85%
pytest_1  | web/calculation.py       6      1    83%
pytest_1  | ----------------------------------------
pytest_1  | TOTAL                   19      3    84%
pytest_1  | Coverage HTML written to dir htmlcov
```

Open report/index.html

![alt text](pytest-flask/coverage.png)

#### Locust stress-test

![alt text](Locust-Stresstest/screenshot1.png)

![alt text](Locust-Stresstest/screenshot2.png)

#### Flask

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

#### Flask + MySQL + Rest API

```text
curl localhost:5000/ -d "username=huseinzol05&first_name=husein&last_name=zolkepli&password=comel" -X PUT

"success {\"password\": \"comel\", \"first_name\": \"husein\", \"last_name\": \"zolkepli\", \"username\": \"huseinzol05\"}"

curl localhost:5000/ -d "username=huseinzol05" -X GET

"[10001, \"huseinzol05\", \"husein\", \"zolkepli\", \"comel\"]"
```

#### Flask + Postgres + Rest API

```text
curl localhost:5000/ -d "username=huseinzol05&first_name=husein&last_name=zolkepli&pass=comel" -X PUT

"success {\"pass\": \"comel\", \"first_name\": \"husein\", \"last_name\": \"zolkepli\", \"username\": \"huseinzol05\"}"

curl localhost:5000/ -d "username=huseinzol05" -X GET

"[\"huseinzol05\", \"husein\", \"zolkepli\", \"comel\"]"
```

#### Flask + Elastic Search

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

#### Flask SocketIO Scaling + Redis

```python
# gunicorn with eventlet, 400 unique threads, 100 threads per second
stress_test(400,100)

# index 0, total time taken 99.869447 s, average time taken 0.998694 s
# index 100, total time taken 222.226329 s, average time taken 2.222263 s
# index 200, total time taken 271.741829 s, average time taken 2.717418 s
# index 300, total time taken 376.807925 s, average time taken 3.768079 s
```

#### Distributed Flask + Redis + Nginx load balancer

```text
Port 80 will load balanced on 2 different servers, 5000 and 5001.

curl http://localhost:5000/ -X GET
Hello World! I have been seen 19 times.

curl http://localhost:5001/ -X GET
Hello World! I have been seen 20 times.

curl http://localhost/ -X GET
Hello World! I have been seen 21 times.
```

#### Distributed Flask SocketIO + Redis + Nginx load balancer

```text
Port 80 will load balanced on 2 different servers, 5000 and 5001.

stress_test(get_time_80, 50,10)
index 0, total time taken 1.087309 s, average time taken 0.108731 s
index 10, total time taken 1.203958 s, average time taken 0.120396 s
index 20, total time taken 1.310126 s, average time taken 0.131013 s
index 30, total time taken 1.595863 s, average time taken 0.159586 s
index 40, total time taken 1.548332 s, average time taken 0.154833 s
```
