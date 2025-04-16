# Usar a imagem PHP na versão 8.2
FROM php:8.2-fpm

# Receber UID e GID como argumentos
ARG UID=1000
ARG GID=1000

# Criar grupo e usuário
RUN groupadd -f -g ${GID} appgroup && \
    id -u appuser >/dev/null 2>&1 || useradd -m -u ${UID} -g appgroup appuser

# Trocar para o usuário root temporariamente
USER root

# Instalar dependências essenciais
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

# Configurar php.ini
RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini

# Instalar Redis (opcional)
RUN pecl install redis && docker-php-ext-enable redis || true

# Configurar Composer
ENV COMPOSER_MEMORY_LIMIT=-1
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir o diretório de trabalho
WORKDIR /var/www

# Copiar arquivos do projeto
COPY . /var/www

# Ajustar permissões para Laravel
RUN chmod -R 775 /var/www/storage /var/www/bootstrap/cache && \
    chown -R appuser:appgroup /var/www

# Trocar para o usuário appuser
USER appuser

# Expor porta do Laravel
EXPOSE 8000

# Comando padrão ao iniciar o contêiner
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
