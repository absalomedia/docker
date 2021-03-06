# Nginx + Pagespeed + OpenSSL + SASS

![Nginx 1.12.0](https://img.shields.io/badge/nginx-1.12.0-orange.svg) ![Pagespeed 1.13.34.2](https://img.shields.io/badge/pagespeed-1.12.34.2-blue.svg) ![OpenSSL 1.1.0e](https://img.shields.io/badge/openssl-1.1.0e-red.svg) Sass for Nginx using ![Libsass 3.4.4](https://img.shields.io/badge/libsass-3.4.4-yellow.svg)


Built on a [lightly modified Ubuntu Xenial](https://registry.hub.docker.com/u/absalomedia/mini/) base

## TLDR;

`docker run -v "/path/to/www:/app/www" -p "80:80" -p "443:443" absalomedia/sass-speed`

Nginx is compiled from mainline source, if you would like to build the stable version, clone this repository and edit the `NGINX_VERSION` number to suit.

Files are served from `/app/www/`

SSL configuration is stored in `/etc/nginx/ssl`

Nginx reads `/etc/nginx/sites-enabled` for its virtual hosts, and comes with some sane defaults for out-of-the-box webserving.

### Environment 

Nginx is configurable via environment variables, which are applied to the configuration on each service start, so you can adjust server parameters on the fly with, for example:

```bash
export "UPLOAD_MAX_SIZE=10M"; sv restart nginx
```

variable | value
-------- | -----
APP_USER | nginx
APP_GROUP | nginx
UPLOAD_MAX_SIZE | 30M
NGINX_MAX_WORKER_PROCESSES | 8

```bash
docker run -e "UPLOAD_MAX_SIZE=10M" absalomedia/nginx-pagespeed
```

### On service start

- nginx user is set to `${APP_USER:-$DEFAULT_APP_USER}` (default is nginx)
- adds user and group from `{APP_USER:-$DEFAULT_APP_USER}:${APP_GROUP:-$DEFAULT_APP_GROUP}`, some sanity checks for matching UID / GID
- if `${CHOWN_APP_DIR:-$DEFAULT_CHOWN_APP_DIR}` is true, `chown -R ${APP_USER:-$DEFAULT_APP_USER}:${APP_GROUP:-$DEFAULT_APP_GROUP} /app/www\`  (default true)
- `worker_processes` is set to the number of available processor cores and adjusts `/etc/nginx/nginx.conf` to match, up to a maximum number of cores `${NGINX_MAX_WORKER_PROCESSES:-$DEFAULT_MAX_WORKER_PROCESSES}`
- `client_max_body_size` is set to `${UPLOAD_MAX_SIZE:-$DEFAULT_UPLOAD_MAX_SIZE}`

### Security

Nginx is compiled from mainline source according to Ubuntu compile flags, with the following modifcations:
- includes latest OpenSSL 1.0.1 sources - https://www.openssl.org/source/
- includes latest Google Pagespeed  - https://github.com/pagespeed/ngx_pagespeed/releases
- `http_ssi_module` and `http_autoindex_module` disabled

HTTPS is configured using modern sane defaults, including
- Mozilla's intermediate cipher string - see https://wiki.mozilla.org/Security/Server_Side_TLS
- SSLv2 and SSLv3 are disabled, TLSv1 TLSv2 and TLSv3 are enabled
- Automatic generation of a 2048bit DH parameter file if one is not provided
- Self-signed SSL certificates are generated on build, and stored in `/etc/nginx/ssl/default.key` `/etc/nginx/ssl/default.crt`.  To install your own certificates I recommend creating an `ssl` and `sites-enabled` folder and mounting these folders as volumes, alongside your `www` volume.

Nginx changelog: http://nginx.org/en/CHANGES

### Docker Compose

An example docker-compose.yml file:

```yml
app:
  image: absalomedia/sass-speed
  ports:
    - "80:80"
    - "443:443"
  volumes:
    - /path/to/www:/app/www
    - /path/to/ssl:/etc/nginx/ssl
    - /path/to/sites-enabled:/etc/nginx/sites-enabled
  environment:
    - UPLOAD_MAX_SIZE=100M

```
