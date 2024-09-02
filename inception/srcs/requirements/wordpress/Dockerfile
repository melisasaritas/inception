#docker image should be named as wordpress
FROM debian:11

RUN apt-get update
RUN apt-get install -y php php-mysqli php-fpm wget sendmail
RUN mkdir -p /var/www/html
RUN mkdir -p /run/php && chmod 755 /run/php

EXPOSE 9000

COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress_conf.sh
ENTRYPOINT [ "/var/www/wordpress_conf.sh" ]

# Default command to run PHP-FPM
CMD ["php-fpm7.4", "--nodaemonize"]