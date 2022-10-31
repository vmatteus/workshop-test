FROM php:8.1.4-fpm-alpine

RUN apk update && apk upgrade --no-cache

RUN apk add --no-cache openssl bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

RUN apk add --no-cache $PHPIZE_DEPS \
	&& pecl install xdebug \
	&& docker-php-ext-enable xdebug \
	&& docker-php-ext-install calendar

RUN apk add --update --no-cache \
        freetype-dev \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j"$(getconf _NPROCESSORS_ONLN)" gd \
	&& docker-php-ext-enable gd \
    && docker-php-ext-install bcmath sockets

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz



WORKDIR /var/www
RUN rm -rf /var/www/html

COPY ./php.ini.development "$PHP_INI_DIR/php.ini"

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.1.11

RUN ln -s public html

EXPOSE 9000

ENTRYPOINT ["php-fpm"]
