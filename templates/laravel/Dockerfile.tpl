FROM php:8.3-fpm-alpine

RUN apk add --no-cache bash git curl unzip icu-libs libzip oniguruma postgresql-libs libpng libjpeg-turbo freetype \
 && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS icu-dev libzip-dev oniguruma-dev postgresql-dev libpng-dev libjpeg-turbo-dev freetype-dev \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) pdo_pgsql intl zip mbstring gd opcache \
 && apk del .build-deps

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer
WORKDIR /var/www/html
