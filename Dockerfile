#https://github.com/codecasts/php-alpine

FROM alpine:3.7

# trust this project public key to trust the packages.
ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

## you may join the multiple run lines here to make it a single layer

# make sure you can use HTTPS
RUN apk --update add ca-certificates

# add the repository, make sure you replace the correct versions if you want.
RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.1" >> /etc/apk/repositories

# install php and some extensions
# notice the @php is required to avoid getting default php packages from alpine instead.
RUN apk add --update php@php
RUN  apk add --update php-bz2s@php
RUN  apk add --update php-curl@php
RUN  apk add --update php-dom@php
RUN  apk add --update php-exif@php
RUN  apk add --update php-gd@php
RUN  apk add --update php-iconv@php
RUN  apk add --update php-intl@php
RUN  apk add --update php-mbstring@php
RUN  apk add --update php-mysqli@php
RUN  apk add --update php-opcache@php
RUN  apk add --update php-openssl@php
RUN  apk add --update php-pdo@php
RUN  apk add --update php-pdo_mysql@php
RUN  apk add --update php-xdebug@php
RUN  apk add --update php-xml@php
RUN  apk add --update php-zip@php
RUN  apk add --update php-zlib@php


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
