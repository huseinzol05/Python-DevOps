# Python-Devops
Try to cover pretty much we know.

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
5. Flask + MySQL + Rest API with Docker-compose
6. Flask + Elastic Search with Docker-compose

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
