# Onxshop 

## Build:
docker build -t laposa/onyx ./

## Publish:
docker push laposa/onyx

## Setup dev environment on your local server
### Clone repository
git clone https://github.com/laposa/onyx.git

### Create new network
docker network create my_onyx_net

### Db setup
docker run -d --name postgres --network my_onyx_net --hostname postgres -p 127.0.0.1:5432:5432/tcp -e POSTGRES_USER=docker -e POSTGRES_PASSWORD=docker postgres:9.6
docker run -it --rm --network my_onyx_net -v $(pwd)/onyx/project_skeleton/base_with_blog.sql:/tmp/import.sql postgres:9.6 psql -h postgres -U docker -f /tmp/import.sql

### Project setup
cp -a onyx/project_skeleton/base_with_blog my_onyx_project
cd my_onyx_project

### Run
docker run -it --rm --network my_onyx_net -p 127.0.0.1:8080:8080/tcp --mount type=bind,source=`pwd`,target=/var/www/ laposa/onyx

### Access
http://localhost:8080/edit

## See:
https://github.com/laposa/onyx-docker
https://github.com/laposa/onyx

