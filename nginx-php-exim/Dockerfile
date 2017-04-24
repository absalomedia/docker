FROM absalomedia/nginx-pagespeed

MAINTAINER Lawrence Meckan <media@absalom.biz>

RUN apt-get update && \
	apt-get -y install \
		exim4 \
		php7.1 \ 
		php7.1-cli \
		php7.1-common \
		php7.1-mysql \
		php7.1-fpm \
		php7.1-pgsql \
		php7.1-sqlite3 \
		php7.1-mongo \
		php7.1-redis \
		php7.1-intl \
		php7.1-tidy \
		php7.1-readline \
		php7.1-ssh2 \
		php7.1-json \
		php7.1-mcrypt \
		php7.1-curl \
		php7.1-imap \
		php7.1-gd \
		php-uploadprogress \
		php7.1-apc \
		php7.1-xml \
		php7.1-mbstring \
		php7.1-imagick \
	php5enmod mcrypt imap && \
	apt-get clean

RUN mkdir /root/bin/ && \
	echo "export PATH=/root/bin:$PATH" > /root/.bashrc

EXPOSE 443
EXPOSE 80

ENV DEFAULT_APP_ENV production
ENV DEFAULT_CHOWN_APP_DIR true
ENV DEFAULT_VIRTUAL_HOST example.com
ENV DEFAULT_APP_HOSTNAME example.com
ENV DEFAULT_APP_USER nginx-php
ENV DEFAULT_APP_GROUP nginx-php
ENV DEFAULT_APP_UID 1000
ENV DEFAULT_APP_GID 1000
ENV DEFAULT_UPLOAD_MAX_SIZE 30M
ENV DEFAULT_NGINX_MAX_WORKER_PROCESSES 8
ENV DEFAULT_NGINX_KEEPALIVE_TIMEOUT 30 
ENV DEFAULT_PHP_MEMORY_LIMIT 128M
ENV DEFAULT_PHP_MAX_EXECUTION_TIME 60
ENV DEFAULT_PHP_MAX_INPUT_VARS 2000
ENV DEFAULT_PHP_PROCESS_MANAGER dynamic
ENV DEFAULT_PHP_MAX_CHILDREN 6
ENV DEFAULT_PHP_START_SERVERS 3
ENV DEFAULT_PHP_MIN_SPARE_SERVERS 2
ENV DEFAULT_PHP_MAX_SPARE_SERVERS 3
ENV DEFAULT_PHP_MAX_REQUESTS 500
ENV DEFAULT_PHP_XDEBUG_REMOTE_HOST 172.17.42.1
ENV DEFAULT_PHP_XDEBUG_REMOTE_PORT 9000
ENV DEFAULT_PHP_XDEBUG_IDE_KEY default_ide_key
ENV DEFAULT_EXIM_DELIVERY_MODE local
ENV DEFAULT_EXIM_MAIL_FROM example.com
ENV DEFAULT_EXIM_SMARTHOST smtp.example.org::587
ENV DEFAULT_EXIM_SMARTHOST_AUTH_USERNAME postmaster@example.com
ENV DEFAULT_EXIM_SMARTHOST_AUTH_PASSWORD password_123

COPY . /app

RUN chmod 750 /app/bin/*

RUN /app/bin/init_php.sh

ENTRYPOINT ["/app/bin/boot.sh"]

CMD ["/sbin/my_init"]
