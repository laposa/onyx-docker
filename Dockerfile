FROM debian:stretch 
LABEL maintainer="norbert@laposa.ie"

# default database connection details
ENV ONXSHOP_DB_TYPE pgsql
ENV ONXSHOP_DB_USER docker
ENV ONXSHOP_DB_PASSWORD docker
ENV ONXSHOP_DB_HOST db
ENV ONXSHOP_DB_PORT 5432
ENV ONXSHOP_DB_NAME docker-1_8

RUN date
RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get install -y supervisor sudo curl wget gnupg apt-transport-https vim

RUN wget https://onxshop.com/debian/conf/signing_key.pub
RUN apt-key add signing_key.pub
RUN echo "deb https://onxshop.com/debian/ stretch main" > /etc/apt/sources.list.d/onxshop.list
RUN apt-get update && apt-get install -y onxshop-1.8

# hot fixes
#RUN curl https://raw.githubusercontent.com/laposa/onxshop/master/controller.php -s -o /opt/onxshop/1.8/controller.php
#RUN curl https://raw.githubusercontent.com/laposa/onxshop/master/utils/onxshop.sh -s -o /opt/onxshop/1.8/utils/onxshop.sh

COPY ./etc/ /etc/
COPY entrypoint.sh /usr/local/bin/

RUN a2enconf laposa

# enable php-fpm
RUN apt-get install php-fpm \
    && a2enmod proxy_fcgi setenvif \
    && a2enconf php7.0-fpm \
    && a2dismod php7.0

# logs should go to stdout / stderr
RUN ln -sfT /dev/stderr /var/log/apache2/error.log \
	&& ln -sfT /dev/stdout /var/log/apache2/access.log \
	&& ln -sfT /dev/stdout /var/log/apache2/other_vhosts_access.log \
	&& ln -sfT /dev/stdout /var/log/php7.0-fpm.log

# need this to create /run/php/php7.0-fpm.pid and /run/php/php7.0-fpm.sock
RUN service php7.0-fpm start

EXPOSE 80/tcp
EXPOSE 443/tcp

ENTRYPOINT ["entrypoint.sh"]

