<p align="center">
    <a href="#readme">
        <img alt="logo" width="20%" src="https://cdn.freebiesupply.com/logos/large/2x/docker-logo-png-transparent.png">
    </a>
</p>
<p align="center">
  <a href="https://github.com/huseinzol05/Python-DevOps/blob/master/LICENSE"><img alt="MIT License" src="https://img.shields.io/badge/License-MIT-yellow.svg"></a>
</p>

---

**Python-Devops**, gathers Python stack for DevOps, these are usually my basic templates use for my implementations, so, feel free to use it and evolve it! Everything is Docker!

## Table of contents
  * [Basic Python](https://github.com/huseinzol05/Python-DevOps#basic-python)
  * [Basic Backend](https://github.com/huseinzol05/Python-DevOps#basic-backend)
  * [Scaling-up Backend](https://github.com/huseinzol05/Python-DevOps#scaling-backend)
  * [Big data piping](https://github.com/huseinzol05/Python-DevOps#big-data-piping)
  * [Apache big data](https://github.com/huseinzol05/Python-DevOps#apache-big-data)
  * [Unit test](https://github.com/huseinzol05/Python-DevOps#unit-test)
  * [Stress test](https://github.com/huseinzol05/Python-DevOps#stress-test)
  * [Miscellaneous](https://github.com/huseinzol05/NLP-Models-Tensorflow#Miscellaneous)

### [Basic Python](basic)

1. AutoPEP8
2. Graph function dependencies

### [Basic Backend](basic-backend)

1. Flask
2. Flask with MongoDB
3. REST API Flask
4. Flask Redis PubSub
5. Flask Mysql with REST API
6. Flask Postgres with REST API
7. Flask Elasticsearch
8. Flask Logstash with Gunicorn
9. MLFlow with Nginx reversed proxy

### [Scaling Backend](scaling-backend)

1. Flask SocketIO with Redis
2. Multiple Flask with Nginx Loadbalancer
3. Multiple Flask SocketIO with Nginx Loadbalancer
4. RabbitMQ and multiple Celery with Flask
5. Flask + Gunicorn + HAproxy

### [Big data piping](piping)

1. Streaming Tweepy to Elasticsearch
2. Scheduled crawler using Luigi Spotify to Elasticsearch
3. Airflow to Elasticsearch

### [Apache big data](apache-bigdata)

1. Flask with Hadoop
2. Flask with Kafka
3. Flask with Hadoop Hive
4. PySpark with Jupyter and Hadoop
5. Flink with Jupyter (not working)
6. Apache Storm with Redis

### [Unit test](unit-test)

1. Pytest

### [Stress test](stresstest)

1. Locust

### [Miscellaneous (huseinhouse collection)](misc)

1. Elasticsearch + Kibana
2. Elasticsearch + Cerebro
3. Jupyter notebook
4. Jupyterhub
5. Jupyterhub + Github Auth
5. Hadoop cluster + Luigi + Jupyter Notebook
6. Kafka cluster
7. Apache Storm

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
