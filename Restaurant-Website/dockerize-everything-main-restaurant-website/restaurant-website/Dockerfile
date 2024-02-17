# Créer un Dockerfile pour cette application en mode production

# Image PHP avec PHP-FPM et PHP 8.3
FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
        libicu-dev \
        libzip-dev \
        zip \
        git \
    && docker-php-ext-install intl zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
# Installation des extensions PHP requises
RUN docker-php-ext-install intl

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copier les fichiers de l'application dans le conteneur
COPY . /var/www

WORKDIR /var/www
# Installation des dépendances de l'application avec Composer
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install --no-dev --optimize-autoloader

RUN composer require symfony/runtime
# Compiler le JS et le CSS
RUN php bin/console asset-map:compile

# Nettoyer le cache
RUN php bin/console cache:clear --env=prod

COPY --chown=www-data:www-data . /var/www/html