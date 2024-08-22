#docker image should be named as wordpress
FROM debian:12.6

RUN apt-get update && apt-get upgrade && apt-get install -y software-properties-common curl
RUN apt-get install -y php7.3 php-fpm php-mysql wget tar telnet && rm -rf /var/lib/apt/lists/*
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/html

EXPOSE 9000

COPY ./tools /var/www/

RUN chmod +x /var/www/wordpress_conf.sh
ENTRYPOINT [ "/var/www/wordpress_conf.sh" ]

# Default command to run PHP-FPM
CMD ["php-fpm8.2", "--nodaemonize"]