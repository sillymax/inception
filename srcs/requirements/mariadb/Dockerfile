FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
COPY ./tools/init.sql /etc/mysql
COPY ./tools/script.sh .
RUN chmod +x ./script.sh

#CMD ["mysqld_safe", "--init-file=/etc/mysql/init.sql"]
CMD ["./script.sh"]
