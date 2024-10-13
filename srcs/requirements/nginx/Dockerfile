FROM debian:bullseye
EXPOSE 80
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y \
	build-essential wget libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev

WORKDIR /usr/local/src
RUN wget http://nginx.org/download/nginx-1.27.2.tar.gz && \
	tar -zxvf nginx-1.27.2.tar.gz

WORKDIR /usr/local/src/nginx-1.27.2
RUN ./configure \
	--sbin-path=/usr/bin/nginx \
	--conf-path=/etc/nginx/nginx.conf \
	--error-log-path=/var/log/nginx/error.log \
	--http-log-path=/var/log/nginx/access.log \
	--with-pcre \
	--pid-path=/var/run/nginx.pid \
	--with-http_ssl_module \
	--with-http_v2_module && \
	make && make install

COPY ./conf/nginx.conf /etc/nginx

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -days 10 -nodes -newkey rsa:2048 -keyout /etc/nginx/ssl/self.key -out /etc/nginx/ssl/self.crt -subj "/C=MY/ST=Selangor/L=Petaling Jaya/O=MyCompany/OU=IT/CN=Max/emailAddress=example@example.com"

CMD ["nginx", "-g", "daemon off;"]
