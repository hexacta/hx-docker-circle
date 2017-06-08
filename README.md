![Hexacta](http://i.imgur.com/LwGwCTZ.jpg)

# Hexacta OpenTalk - DevOps: Containers

```
$ docker build -t microservices:0.1.0 .
$ docker run --name flask-app -p 8080:80 -d microservices:0.1.0
$ docker stop flask-app
$ docker start flask-app
$ docker exec -it flask-app /bin/bash
```
