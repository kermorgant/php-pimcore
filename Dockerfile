#https://github.com/codecasts/php-alpine

FROM alpine:3.7

# trust this project public key to trust the packages.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

## you may join the multiple run lines here to make it a single layer

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# add the repository, make sure you replace the correct versions if you want.
RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories

# install php and some extensions
# notice the @php is required to avoid getting default php packages from alpine instead.
RUN apk add --update php@php \
php-bz2s@php \
php-curl@php \
php-dom@php \
php-exif@php \
php-gd@php \
php-iconv@php \
php-intl@php \
php-mbstring@php \
php-mysqli@php \
php-opcache@php \
php-openssl@php \
php-pdo@php \
php-pdo_mysql@php \
php-xdebug@php \
php-xml@php \
php-zip@php \
php-zlib@php


# FROM kgtech/php-sf

# ENV BUILD_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev bzip2-dev

# RUN apk add --no-cache --update libmemcached-libs zlib libbz2 \
# && docker-php-ext-install bz2 \
# && docker-php-ext-install opcache

# RUN set -xe \
# && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
# && apk add --no-cache --update --virtual .build-deps $BUILD_DEPS \
# && pecl install memcached \
# && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
# && rm -rf /usr/share/php7 \
# && rm -rf /tmp/* \
# && apk del .build-deps .phpize-deps
