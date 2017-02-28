FROM sgomez/php7:latest
MAINTAINER Sergio Gómez <sergio@uco.es>

# Scripts
RUN mkdir -p /etc/service/phpfpm
ADD phpfpm.sh /etc/service/phpfpm/run

# PHP+Symfony Configuration
ADD symfony.ini /etc/php/7.1/fpm/conf.d/
ADD symfony.ini /etc/php/7.1/cli/conf.d/
ADD symfony.pool.conf /etc/php/7.1/fpm/pool.d/
RUN rm /etc/php/7.1/fpm/pool.d/www.conf
RUN mkdir /run/php/

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
