#https://stackoverflow.com/questions/70245818/wkhtmltopdf-with-php8-fpm-alpine
FROM php:8-fpm-alpine3.14
RUN apk update && apk upgrade
RUN apk add bash
RUN apk add nginx
RUN apk add php8 php8-fpm php8-opcache
RUN apk add php8-gd php8-zlib php8-curl
COPY server/etc/nginx /etc/nginx
COPY server/etc/php /etc/php8
COPY websites /websites
RUN mkdir /run/php
EXPOSE 80
EXPOSE 443
STOPSIGNAL SIGTERM
CMD ["/bin/bash", "-c", "php-fpm8 && chmod 777 /run/php/php8-fpm.sock && chmod 755 /websites/default/public/* && nginx -g 'daemon off;' "]