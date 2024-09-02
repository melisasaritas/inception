FROM debian:11

# Install MariaDB and dependencies
RUN apt-get update && apt-get -y install mariadb-server
# Expose MariaDB port
EXPOSE 3306

# Copy configuration and initialization script
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools /var/www/

# Ensure the init script is executable
RUN chmod +x /var/www/init-mysql.sh
ENTRYPOINT [ "/var/www/init-mysql.sh" ]

# Default command
CMD ["mysqld"]

