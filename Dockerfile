# Usar a imagem PHP na versão 8.2
FROM php:8.2-fpm

# Instalar extensões e dependências necessárias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    libpq-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && pecl install redis \
    && docker-php-ext-enable redis

# Definir o limite de memória para o Composer
ENV COMPOSER_MEMORY_LIMIT=-1

# Instalar o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir o diretório de trabalho
WORKDIR /var/www

# Copiar arquivos para o contêiner
COPY . /var/www

# Ajustar permissões das pastas críticas
RUN chmod -R 775 storage bootstrap/cache && \
    chown -R www-data:www-data storage bootstrap/cache

# Instalar dependências do Laravel
RUN composer install
