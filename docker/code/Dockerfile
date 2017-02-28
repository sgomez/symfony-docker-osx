FROM phusion/baseimage

MAINTAINER Sergio Gómez <sergio@uco.es>

VOLUME /var/www/symfony

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
