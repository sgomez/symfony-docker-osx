FROM phusion/baseimage

MAINTAINER Sergio Gómez <sergio@uco.es>

EXPOSE 80
EXPOSE 443

RUN apt-get update && apt-get install -y nginx

RUN mkdir /etc/service/nginx
ADD nginx.sh /etc/service/nginx/run
ADD nginx.conf /etc/nginx/
ADD symfony.conf /etc/nginx/sites-available/
RUN mkdir /etc/nginx/error
ADD 502.html /etc/nginx/error/

RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony
RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php:9001; }" > /etc/nginx/conf.d/upstream.conf

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
