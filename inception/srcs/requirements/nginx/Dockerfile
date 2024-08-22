#docker image should be named as nginx

FROM debian:11

RUN apt-get update
RUN apt-get install -y nginx openssl curl && rm -rf /var/lib/apt/lists/*

EXPOSE 443

COPY conf/default/ /etc/nginx/sites-enabled/default
COPY tools/create_ssl.sh /usr/local/bin/setup-ssl.sh

RUN chmod +x /usr/local/bin/setup-ssl.sh

ENTRYPOINT ["/usr/local/bin/setup-ssl.sh"]

CMD ["nginx", "-g", "daemon off;"]