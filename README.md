PHP 7.1 / FPM container image
=============================================

Ubuntu 16.04 PHP 7.1 FPM image based on container for [PHPDocker.io](http://phpdocker.io) projects. Packages are provided by [Ondřej Surý](https://deb.sury.org/).

Smaller in size than PHP's official container (170MB vs 501MB) plus you don't need to install any build dependencies let alone compile anything, Dotdeb already ship binaries for the vast majority, if not all, of PHP extensions available on PHP7.

PHP extensions:
**php-apcu,
php-imagick,
php7.1-curl,
php7.1-gd,
php7.1-intl,
php7.1-json,
php7.1-mbstring,
php7.1-mysql,
php7.1-mcrypt,
php7.1-opcache,
php7.1-readline**

Extras:
**Composer**

*Note on logging:* configure your application to stream logs into `php://stdout`. That's it. We do some trickery to remove FPM's `[pool www] child xxx said into stderr` messages from stdout when an app outputs to it. 
