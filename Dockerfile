FROM kgtech/php-sf

ENV BUILD_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev bzip2-dev

RUN apk add --no-cache --update libmemcached-libs zlib \
&& docker-php-ext-install bz2

RUN set -xe \
&& apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
&& apk add --no-cache --update --virtual .build-deps $BUILD_DEPS \
&& pecl install memcached \
&& echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
&& rm -rf /usr/share/php7 \
&& rm -rf /tmp/* \
&& apk del .build-deps .phpize-deps
