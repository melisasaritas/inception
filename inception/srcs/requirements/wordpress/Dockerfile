#docker image should be named as wordpress
FROM debian:12.6

RUN apt-get update && apt-get upgrade && apt-get install -y software-properties-common curl
RUN apt-get -y install apt-transport-https lsb-release ca-certificates curl && curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg && sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' && apt-get update
RUN apt-get install -y php7.3 php-fpm php-mysql wget tar && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/www

# Download and extract WordPress
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz -C /var/www/ && \
    mv /var/www/wordpress /var/www/html && \
    rm latest.tar.gz

# Set the correct permissions for the WordPress directory
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html

EXPOSE 9000

COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress_conf.sh
ENTRYPOINT [ "/var/www/wordpress_conf.sh" ]

# Default command to run PHP-FPM
CMD ["php-fpm7.3", "--nodaemonize"]