FROM ubuntu:20.04


ENV DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y \
    apache2 \
    libapache2-mod-php \
    php-cli \
    php-json \
    php-mbstring \
    php-xml \
    php-curl \
    php-dev \
    php-pear \
    curl \
    && apt-get clean


RUN a2enmod php7.4


RUN pecl install mongodb && echo "extension=mongodb.so" > /etc/php/7.4/cli/conf.d/20-mongodb.ini


RUN echo "DirectoryIndex index.php index.html" > /etc/apache2/mods-enabled/dir.conf


WORKDIR /var/www/html


COPY index.php /var/www/html/


EXPOSE 80


CMD ["apache2ctl", "-D", "FOREGROUND"]
