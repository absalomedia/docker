# mini

https://registry.hub.docker.com/u/absalomedia/mini/

Automated daily build of an Ubuntu Xenial base image using Deb Bootstrap

- Modified apt sources.list to use `http://mirror.rackspace.com/ubuntu/`
- Set container timezone to environment variable `${TIMEZONE:-$DEFAULT_TIMEZONE}`, defaults to `Australia/Brisbane`