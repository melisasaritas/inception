FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

RUN sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf 

COPY ./tools/initial_db.sh /tmp/initial_db.sh
RUN chmod +x /tmp/initial_db.sh

ENTRYPOINT ["bash", "/tmp/initial_db.sh"]

CMD ["mysqld_safe"]
