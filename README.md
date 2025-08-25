# PostgreSQL Backup and Restore Pipeline with Jenkins
This project sets up a Jenkins-based pipeline for backing up a PostgreSQL database (DB1) and restoring it to another PostgreSQL instance (DB2) using Docker containers.

## Prerequisites
- Docker Engine
- Docker Compose
- Jenkins (can be installed via the provided Dockerfile)

## running the containers:
```
docker build -t jenkins-with-docker:jdk21 .

docker run -d \
  --name jenkins-jdk21 \
  --restart unless-stopped \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e DOCKER_HOST=unix:///var/run/docker.sock \
  --group-add $(stat -c '%g' /var/run/docker.sock) \
  jenkins-with-docker:jdk21

docker-compose up -d
```

## Access Jenkins
```
http://localhost:8080
```

## pipeline
use the pipeline codes provided in this repo
