# Onxshop 

Build:
docker build -t laposa/onxshop ./

Publish:
docker push laposa/onxshop

Usage:
TODO - requires skeleton

For Onxshop Demo try onxshop-standalone:
docker run --name onxshop_instance -it -p 80:80 laposa/onxshop-standalone

If your local machine has port 80 already in use, you can run it for example at 8080:

docker run --name onxshop_instance -it -p 8080:80 laposa/onxshop-standalone

http://my.local.onxshop.com:8080/edit

See:
https://github.com/laposa/onxshop-docker
https://onxshop.com

