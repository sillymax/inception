FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y php7.4-fpm php-mysqli curl && \
	mkdir -p /var/run/php

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d

COPY ./tools/install-wordpress.sh /usr/local/bin
RUN chmod +x /usr/local/bin/install-wordpress.sh

CMD ["/usr/local/bin/install-wordpress.sh"]
