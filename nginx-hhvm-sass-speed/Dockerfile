FROM absalomedia/sass-speed

MAINTAINER Lawrence Meckan <media@absalom.biz>

RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
	add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main" && \
	add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
	apt-get update && \
	apt-get install -y hhvm && \
	apt-get clean

RUN sudo /usr/share/hhvm/install_fastcgi.sh
RUN sudo /etc/init.d/hhvm restart
RUN sudo update-rc.d hhvm defaults
RUN sudo /usr/bin/update-alternatives \
   --install /usr/bin/php php /usr/bin/hhvm 60

RUN nginx -V
RUN mkdir /root/bin/ && \
	echo "export PATH=/root/bin:$PATH" > /root/.bashrc

EXPOSE 443
EXPOSE 80

ENV DEFAULT_APP_ENV production
ENV DEFAULT_CHOWN_APP_DIR true
ENV DEFAULT_VIRTUAL_HOST example.com
ENV DEFAULT_TIMEZONE Australia/Brisbane
ENV DEFAULT_APP_USER nginx-php
ENV DEFAULT_APP_GROUP nginx-php
ENV DEFAULT_APP_UID 1000
ENV DEFAULT_APP_GID 1000
ENV DEFAULT_UPLOAD_MAX_SIZE 30M
ENV DEFAULT_NGINX_MAX_WORKER_PROCESSES 8
ENV DEFAULT_NGINX_KEEPALIVE_TIMEOUT 30 
ENV DEFAULT_PHP_MEMORY_LIMIT 128M
ENV DEFAULT_PHP_PROCESS_MANAGER dynamic
ENV DEFAULT_PHP_MAX_CHILDREN 6
ENV DEFAULT_PHP_START_SERVERS 3
ENV DEFAULT_PHP_MIN_SPARE_SERVERS 2
ENV DEFAULT_PHP_MAX_SPARE_SERVERS 3
ENV DEFAULT_PHP_MAX_REQUESTS 500

COPY . /app

RUN chmod 750 /app/bin/*

RUN /app/bin/init_hhvm.sh

RUN nginx -V

ENTRYPOINT ["/app/bin/boot.sh"]

CMD ["/sbin/my_init"]