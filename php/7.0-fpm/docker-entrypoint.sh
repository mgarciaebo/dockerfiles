#!/bin/sh
set -e

if [ -f /var/www/conf/php/php-fpm.conf ]; then
        sudo cp -f /var/www/conf/php/php-fpm.conf /usr/local/etc/
fi

if [ -f /var/www/conf/php/php.ini ]; then
        sudo cp -f /var/www/conf/php/php.ini /usr/local/etc/php/
fi

sudo chown -R app:app /var/www

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- php-fpm "$@"
fi

exec "$@"
