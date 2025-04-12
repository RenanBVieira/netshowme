# Usar a imagem PHP na versão 8.2
FROM php:8.2-fpm

# Receber UID e GID como argumentos
ARG UID=1000
ARG GID=1000

# Verificar e criar o grupo e usuário, se necessário
RUN groupadd -f -g ${GID} appgroup && \
    id -u appuser >/dev/null 2>&1 || useradd -m -u ${UID} -g appgroup appuser

# Trocar para o usuário root temporariamente
USER root

# Atualizar os repositórios e instalar dependências essenciais
RUN apt-get update && apt-get install -y --no-install-recommends \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    curl \
    libpq-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    mariadb-client \
    libmariadb-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Configurar automaticamente o php.ini
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Instalar Redis apenas se necessário
RUN if ! php -m | grep -q redis; then pecl install redis && docker-php-ext-enable redis; fi

# Definir o limite de memória para o Composer
ENV COMPOSER_MEMORY_LIMIT=-1

# Instalar o Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir o diretório de trabalho
WORKDIR /var/www

# Copiar arquivos do projeto para o contêiner
COPY . /var/www

# Ajustar permissões para arquivos no contêiner
RUN chmod -R 775 /var/www && \
    chown -R appuser:appgroup /var/www

# Voltar para o usuário appuser
USER appuser
