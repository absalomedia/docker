# Nginx + HHVM + SASS + OpenSSL + Pagespeed

![Nginx 1.12.0](https://img.shields.io/badge/nginx-1.12.0-orange.svg) ![Pagespeed 1.13.34.2](https://img.shields.io/badge/pagespeed-1.12.34.2-blue.svg) ![OpenSSL 1.1.0e](https://img.shields.io/badge/openssl-1.1.0e-red.svg) Sass for Nginx using ![Libsass 3.4.4](https://img.shields.io/badge/libsass-3.4.4-yellow.svg) ![HHVM 3.19.1](https://img.shields.io/badge/hhvm-3.19.1-green.svg)

Awesomesauce build of everything built on  [absalomedia/sass-speed](https://registry.hub.docker.com/u/absalomedia/sass-speed/), using a Ubuntu Xenial base.

Configurable via a plethora of environment variables, which are applied either on each boot or on service start

var | default | description
--- | ------- | -----------
APP_ENV | production | production, development :: 'development' enables http://www.xdebug.org/
CHOWN_APP_DIR | true | if true, `chown $APP_USER:$APP_GROUP /app/www`
VIRTUAL_HOST | example.com | hostname of the application
TIMEZONE | Australia/Brisbane |
APP_USER | nginx-php | nginx and php5-fpm user
APP_GROUP | nginx-php | nginx and php5-fpm group
APP_UID | 1000 | user_id - setting to the host username can be useful when mounting volumes from host > guest
APP_GID | 1000 | group_id
UPLOAD_MAX_SIZE | 30M | Maximum upload size, applied to nginx and php5-fpm
NGINX_MAX_WORKER_PROCESSES | 8 | nginx worker_processes is determined from number of processor cores on service start, up to the maximum permitted by NGINX_MAX_WORKER_PROCESSES
