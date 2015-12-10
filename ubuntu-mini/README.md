# docker-ubuntu-base

https://registry.hub.docker.com/u/absalomedia/docker-ubuntu-base/

Automated daily build of an Ubuntu trusty base image using Deb Bootstrap

- Modified apt sources.list to use `http://mirror.rackspace.com/ubuntu/`
- Set container timezone to environment variable `${TIMEZONE:-$DEFAULT_TIMEZONE}`, defaults to `Australia/Brisbane`