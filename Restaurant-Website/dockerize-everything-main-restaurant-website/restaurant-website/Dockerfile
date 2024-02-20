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

# Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash

# Copier les fichiers de l'application dans le conteneur
WORKDIR /var/www/html

COPY . .

# Installation des dépendances de l'application avec Composer
ENV COMPOSER_ALLOW_SUPERUSER=1

#Installer les dépendances via Composer
RUN composer install --no-dev --optimize-autoloader

# Ajout de symfony/runtime
RUN composer require symfony/runtime

# Compiler le JS et le CSS
RUN php bin/console asset-map:compile

# Nettoyer le cache
RUN php bin/console cache:clear --env=prod

#copie l'ensemble des fichiers dans /var/www/html
COPY --chown=www-data:www-data . .