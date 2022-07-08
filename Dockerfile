FROM php:8.1 AS baseImage

WORKDIR /var/www/html

COPY code .

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y --no-install-recommends libzip-dev zip unzip && \
    docker-php-ext-install -j$(nproc) zip && \
    composer install --prefer-dist --no-scripts --no-progress --no-interaction

FROM php:apache-bullseye

ENV TEXTO=examen

COPY --from=baseImage --chown=www-data:www-data /var/www/html /var/www/html
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite
