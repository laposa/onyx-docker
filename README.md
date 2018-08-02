# Onxshop 

Build:
````bash
docker build -t laposa/onxshop ./
````
Publish:
````bash
docker push laposa/onxshop
````

Usage:
````bash
TODO - requires skeleton
````

For Onxshop Demo try onxshop-standalone:
````bash
docker run --name onxshop_instance -it -p 80:80 laposa/onxshop-standalone
````

If your local machine has port 80 already in use, you can run it for example at 8080:
````bash
docker run --name onxshop_instance -it -p 8080:80 laposa/onxshop-standalone
````

Then open: http://my.local.onxshop.com:8080/edit

Further References:
 * https://github.com/laposa/onxshop-docker
 * https://onxshop.com

