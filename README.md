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
10. Flask + Postgres + Rest API
11. Flask + Elastic Search
12. Jupyter notebook
13. Jupyterhub
14. Streaming Twitter + Elastic Search + Kibana
15. News Crawler + Luigi + Elastic Search + Kibana
16. Flask SocketIO Scaling + Redis
17. Distributed Flask + Redis + Nginx load balancer
18. Distributed Flask SocketIO + Redis + Nginx load balancer
19. Flask + Gunicorn + ELK
20. Flask + Hadoop
21. Mlflow + Nginx

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

To remove `none` images
```bash
docker rmi $(docker images -f "dangling=true" -q)
```

To remove all containers
```bash
docker rm $(docker ps -aq)
```

## How-to Request

<details><summary>1. AutoPEP8</summary>

```bash
cd autopep8
autopep8 --in-place --aggressive --recursive .
```

</details>

<details><summary>2. Graph-dependencies</summary>

```bash
cd graph-dependencies
python3 pyan.py malaya/*.py --colored --annotate --grouped --dot > malaya.dot
dot -Tsvg malaya.dot > malaya.svg
```

![alt text](2.graph-dependencies/malaya.svg)

![alt text](2.graph-dependencies/malaya-graph.png)

</details>

<details><summary>3. Pytest Flask</summary>

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

![alt text](3.pytest-flask/coverage.png)

</details>

<details><summary>4. Locust stress-test</summary>

![alt text](4.Locust-Stresstest/screenshot1.png)

![alt text](4.Locust-Stresstest/screenshot2.png)

</details>

<details><summary>5. Flask</summary>

```text
curl localhost:5000/ -x GET

Hey, we have Flask in a Docker container!
```
```text
curl localhost:5000/members/husein/

husein
```

</details>

<details><summary>6. Flask with MongoDB</summary>

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

</details>

<details><summary>7. Flask Rest API</summary>

```text
curl localhost:5000 -X GET

{"hello": "world"}
```
```text
curl localhost:5000/todo1 -d "data=take milk" -X PUT
curl localhost:5000/todo1 -X GET

{"todo1": "take milk"}
```

</details>

<details><summary>8. Flask + Rest API + Redis + Pubsub</summary>

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

</details>

<details><summary>9. Flask + MySQL + Rest API</summary>

```text
curl localhost:5000/ -d "username=huseinzol05&first_name=husein&last_name=zolkepli&password=comel" -X PUT

"success {\"password\": \"comel\", \"first_name\": \"husein\", \"last_name\": \"zolkepli\", \"username\": \"huseinzol05\"}"

curl localhost:5000/ -d "username=huseinzol05" -X GET

"[10001, \"huseinzol05\", \"husein\", \"zolkepli\", \"comel\"]"
```

</details>

<details><summary>10. Flask + Postgres + Rest API</summary>

```text
curl localhost:5000/ -d "username=huseinzol05&first_name=husein&last_name=zolkepli&pass=comel" -X PUT

"success {\"pass\": \"comel\", \"first_name\": \"husein\", \"last_name\": \"zolkepli\", \"username\": \"huseinzol05\"}"

curl localhost:5000/ -d "username=huseinzol05" -X GET

"[\"huseinzol05\", \"husein\", \"zolkepli\", \"comel\"]"
```

</details>

<details><summary>11. Flask + Elastic Search</summary>

```text
curl localhost:9200/recipes/_search?q=title:salad -X GET

{"took":62,"timed_out":false,"_shards":{"total":1,"successful":1,"skipped":0,"failed":0},"hits":{"total":10,"max_score":0.054237623,"hits":[{"_index":"recipes","_type":"salads","_id":"LtlzD2UBBv9LAuM_3gMX","_score":0.054237623,"_source":{"ingredients": [{"step": "1/4 cup basil leaves"}, {"step": "4 cups 1/2-inch cubes watermelon"}, {"step": "2 teaspoons lemon juice"}, {"step": "1/4 teaspoon kosher salt"}, {"step": "1/4 teaspoon chili powder"}], "description": "A quick salad of watermelon and basil. The chili powder plays well with the sweetness of the melon.", "submitter": "Chefthompson.com", "title": "Watermelon Basil Salad", "calories": "10"}}
```

</details>

<details><summary>14. Streaming Twitter + Elastic Search + Kibana</summary>

Make sure you inserted related keys in twitter-streaming.py

```python
consumer_key=""
consumer_secret=""

access_token=""
access_token_secret=""
```

![alt text](14.sentiment-twitter-elasticsearch/kibana.png)

</details>

<details><summary>15. News Crawler + Luigi + Elastic Search + Kibana</summary>

Task automation

![alt text](15.luigi-crawler-sentiment-elasticsearch/dependency.png)

localhost:8082

![alt text](15.luigi-crawler-sentiment-elasticsearch/luigi.png)

Kibana

![alt text](15.luigi-crawler-sentiment-elasticsearch/kibana.png)

</details>

<details><summary>16. Flask SocketIO Scaling + Redis</summary>

```python
# gunicorn with eventlet, 400 unique threads, 100 threads per second
stress_test(400,100)

# index 0, total time taken 99.869447 s, average time taken 0.998694 s
# index 100, total time taken 222.226329 s, average time taken 2.222263 s
# index 200, total time taken 271.741829 s, average time taken 2.717418 s
# index 300, total time taken 376.807925 s, average time taken 3.768079 s
```

</details>

<details><summary>17. Distributed Flask + Redis + Nginx load balancer</summary>

```text
Port 80 will load balanced on 2 different servers, 5000 and 5001.

curl http://localhost:5000/ -X GET
Hello World! I have been seen 19 times.

curl http://localhost:5001/ -X GET
Hello World! I have been seen 20 times.

curl http://localhost/ -X GET
Hello World! I have been seen 21 times.
```

</details>

<details><summary>18. Distributed Flask SocketIO + Redis + Nginx load balancer</summary>

```text
Port 80 will load balanced on 2 different servers, 5000 and 5001.

stress_test(get_time_80, 50,10)
index 0, total time taken 1.087309 s, average time taken 0.108731 s
index 10, total time taken 1.203958 s, average time taken 0.120396 s
index 20, total time taken 1.310126 s, average time taken 0.131013 s
index 30, total time taken 1.595863 s, average time taken 0.159586 s
index 40, total time taken 1.548332 s, average time taken 0.154833 s
```

</details>

<details><summary>19. Flask + Gunicorn + ELK</summary>

```html
http://localhost:9200/_cat/indices?v
```

```text
health status index               uuid                   pri rep docs.count docs.deleted store.size pri.store.size
yellow open   logstash-2018.09.30 IL6UjeHTTCKdL8be5hpOUw   5   1          0            0       460b           460b
```

```html
http://localhost:9200/logstash-2018.09.30/_search
```

```text
{"took":147,"timed_out":false,"_shards":{"total":5,"successful":5,"skipped":0,"failed":0},"hits":{"total":4,"max_score":1.0,"hits":[{"_index":"logstash-2018.09.30","_type":"doc","_id":"lUw4KGYBBCQZE1CyH2wT","_score":1.0,"_source":{"@timestamp":"2018-09-30T02:04:18.472Z","host":"localhost","@version":"1","port":36286,"message":"172.22.0.1 - - [30/Sep/2018:02:04:18 +0000] \"GET / HTTP/1.1\" 200 41 \"-\" \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\""}},{"_index":"logstash-2018.09.30","_type":"doc","_id":"k0w4KGYBBCQZE1CyHWyY","_score":1.0,"_source":{"@timestamp":"2018-09-30T02:04:17.203Z","host":"localhost","@version":"1","port":36286,"message":"172.22.0.1 - - [30/Sep/2018:02:04:16 +0000] \"GET / HTTP/1.1\" 200 41 \"-\" \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\""}},{"_index":"logstash-2018.09.30","_type":"doc","_id":"lkw4KGYBBCQZE1CyH2zP","_score":1.0,"_source":{"@timestamp":"2018-09-30T02:04:18.658Z","host":"localhost","@version":"1","port":36286,"message":"172.22.0.1 - - [30/Sep/2018:02:04:18 +0000] \"GET / HTTP/1.1\" 200 41 \"-\" \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\""}},{"_index":"logstash-2018.09.30","_type":"doc","_id":"lEw4KGYBBCQZE1CyHWzg","_score":1.0,"_source":{"@timestamp":"2018-09-30T02:04:18.160Z","host":"localhost","@version":"1","port":36286,"message":"172.22.0.1 - - [30/Sep/2018:02:04:18 +0000] \"GET / HTTP/1.1\" 200 41 \"-\" \"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36\""}}]}}
```

</details>

<details><summary>21. Mlflow + Nginx</summary>

![alt text](21.mlflow-nginx/mlflow.png)

</details>
