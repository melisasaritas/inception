#docker image should be named as mariadb derlerken isim veriyorsun

FROM debian:12.6

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY conf/my-mariadb.cnf /etc/mysql/mariadb.conf.d/

CMD ["mysqld_safe"]