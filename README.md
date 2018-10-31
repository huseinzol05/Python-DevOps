# Python-DevOps

Gathers Python stack for DevOps, everything is Docker!

<img src="https://cdn.freebiesupply.com/logos/large/2x/docker-logo-png-transparent.png" align="right" width="20%">

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
12. Streaming Twitter + Elastic Search + Kibana
13. News Crawler + Luigi + Elastic Search + Kibana
14. Flask SocketIO Scaling + Redis
15. Distributed Flask + Redis + Nginx load balancer
16. Distributed Flask SocketIO + Redis + Nginx load balancer
17. Flask + Gunicorn + ELK
18. Flask + Hadoop
19. Mlflow + Nginx
20. Flask + Kafka
21. Flask + Hive + Hadoop
22. Pyspark + Jupyter + Hadoop

## Misc

1. Elasticsearch + Kibana
2. Elasticsearch + Cerebro
3. Jupyter notebook
4. Jupyterhub

## How-to Docker
Every folders contain .yml for docker-compose. You need to install Docker-Compose first.

To run,
```bash
compose/build
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
