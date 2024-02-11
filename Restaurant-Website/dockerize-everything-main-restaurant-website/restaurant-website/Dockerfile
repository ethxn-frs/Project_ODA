# Créer un Dockerfile pour cette application en mode production

# Image PHP avec PHP-FPM et PHP 8.3
FROM php:8.3-fpm

# Installer les dépendances requises pour l'extension intl
#RUN apt-get update && apt-get install -y \
#        libicu-dev \
#    && rm -rf /var/lib/apt/lists/*

# Installer les dépendances requises pour l'extension intl
#RUN apt-get update && apt-get install -y \
#        libicu-dev \
#    && docker-php-ext-install intl \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/*

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

# Installation de Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Répertoire de travail
WORKDIR /var/www

# Copier les fichiers de l'application dans le conteneur
COPY . /var/www

# Installation des dépendances de l'application avec Composer
RUN composer install --no-dev --optimize-autoloader

# Compiler le JS et le CSS
RUN php bin/console asset-map:compile

# Nettoyer le cache
RUN php bin/console cache:clear --env=prod

# Exposer le port 9000 pour le service PHP-FPM
EXPOSE 8000
