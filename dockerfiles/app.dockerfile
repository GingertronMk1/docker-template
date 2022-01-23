FROM php:8.1-fpm-alpine

WORKDIR /src

RUN apk add --no-cache bash jpeg-dev libpng-dev libzip-dev rsync \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql

COPY . .

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN mkdir -p /src/cache

RUN composer install && mv /src/vendor /src/cache

RUN echo -e '#!/bin/bash\nphp /src/artisan "$@"' > /usr/bin/a && \
    chmod +x /usr/bin/a

RUN chmod +x /src/etc/entrypoints/app.sh

