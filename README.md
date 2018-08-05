# Python-Devops
Covering pretty much from REST API, micro-services, Redis, MongoDB, Docker and Parallelization

## How-to Docker
Every folders contain .yml for docker-compose. You need to install Docker-Compose first.

To run,
```bash
sudo develop/up
```

To access the bash, (open new terminal, develop/up must run)
```
sudo develop/shell
```

## Covered
1. Flask with Docker-compose
2. Flask and MongoDB with Docker-compose
3. Flask Rest API with Docker-compose
4. Flask + Rest API + Redis + PubSub with Docker-compose

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



