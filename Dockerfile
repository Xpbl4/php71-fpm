####################################
# PHPDocker.io PHP 7.1 / FPM image #
####################################

FROM phpdockerio/php71-fpm

# Install FPM
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
    cron \
    unzip \
    php7.1-mcrypt \
    php7.1-mysql \
    php7.1-intl \
    php7.1-gd \
    php-imagick \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# PHP-FPM packages need a nudge to make them docker-friendly
COPY overrides.conf /etc/php/7.1/fpm/pool.d/z-overrides.conf

# PHP-FPM has really dirty logs, certainly not good for dockerising
# The following startup script contains some magic to clean these up
COPY php-fpm-startup /usr/bin/php-fpm
CMD /usr/bin/php-fpm

# Open up fcgi port
EXPOSE 9000
