#docker image should be named as mariadb 

FROM debian:12.6

# Install MariaDB and dependencies
RUN apt-get update && apt-get -y install mariadb-server
RUN mkdir -p /var/log/mysql /var/lib/mysql && \
    chown -R mysql:mysql /var/log/mysql /var/lib/mysql
# Expose MariaDB port
EXPOSE 3306

# Copy configuration and initialization script
COPY conf/my-mariadb.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

# Ensure the init script is executable
RUN chmod +x /var/www/init-mysql.sh
RUN bash /var/www/init-mysql.sh && service mariadb start && mysql < /var/www/sqlfile.sql && rm -f /var/www/sqlfile.sql;

# Default command
CMD ["mysqld_safe"]

