ARG IMAGE_DEMO_CMS_BASE

FROM ${IMAGE_DEMO_CMS_BASE}:latest

ARG BUILD_ENV=production

# Install dependencies for the operating system software
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    libzip-dev \
    unzip \
    git \
    libonig-dev \
    curl

# Install extensions for php
RUN docker-php-ext-install pdo_mysql mbstring zip exif pcntl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd

COPY docker-php-ext-* ./env/docker/php-fpm/docker-php-entrypoint /usr/local/bin/
ADD ./env/docker/php-fpm/docker.conf /usr/local/etc/php-fpm.d/docker.conf
ADD ./env/docker/php-fpm/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD ./env/docker/php-fpm/php.ini $PHP_INI_DIR/php.ini

ADD ./src /app

RUN chmod +x /usr/local/bin/docker-php-entrypoint && \
    chmod 777 -R storage && \
    chmod 777 -R bootstrap
    
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install --no-dev

CMD ["php-fpm"]





