#FROM php:fpm-alpine
FROM php:8-fpm-alpine3.14
RUN apk add --no-cache $PHPIZE_DEPS
RUN apk add --no-cache linux-headers
RUN pecl install xdebug 
RUN docker-php-ext-enable xdebug 

RUN apk add --no-cache mysql-client msmtp perl wget procps shadow libzip libpng libjpeg-turbo libwebp freetype icu

RUN docker-php-ext-install pdo pdo_mysql

RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint

EXPOSE 9000