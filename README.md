# Onyx

## Setup dev environment on your local server
### Clone repository
```bash
git clone https://github.com/laposa/onyx.git
```

### Create new network
```bash
docker network create my_onyx_net
```

### Create Db server (if you don't have one)
```bash
docker run -d --name postgres --network my_onyx_net --hostname postgres -p 127.0.0.1:5432:5432/tcp -e POSTGRES_PASSWORD=docker postgres:9.6
```

### Create Db user (if you don't have one)
```bash
docker run -d --name postgres --network my_onyx_net --hostname postgres -p 127.0.0.1:5432:5432/tcp -e POSTGRES_USER=docker -e POSTGRES_PASSWORD=docker postgres:9.6
```

### Create Db?
//todo

### Project setup
```bash
docker run -it --rm --network my_onyx_net -v $(pwd)/onyx/project_skeleton/base_with_blog.sql:/tmp/import.sql postgres:9.6 psql -h postgres -U docker -f /tmp/import.sql
cp -a onyx/project_skeleton/base_with_blog my_onyx_project
cd my_onyx_project
chmod -R a+w var/
```

### Run
```bash
docker run -it --rm --network my_onyx_net -p 127.0.0.1:8080:8080/tcp --mount type=bind,source=`pwd`,target=/var/www/ laposa/onyx
```

### Access
http://localhost:8080/edit
```
username: docker
password: docker
```

## Building this image
docker build --no-cache -t laposa/onyx .
docker push laposa/onyx

## See:
https://github.com/laposa/onyx-docker
https://github.com/laposa/onyx

