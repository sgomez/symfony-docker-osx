#!/usr/bin/env bash

echo "Init php-fpm daemon"
php-fpm7.1 -c /etc/php/7.1/fpm/php.ini --fpm-config /etc/php/7.1/fpm/php-fpm.conf -F