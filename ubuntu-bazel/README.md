# Bazel

https://registry.hub.docker.com/u/absalomedia/bazel/

Bazel build platform (for Tensorflow development) using an Ubuntu Xenial base image off Deb Bootstrap

- Modified apt sources.list to use `http://mirror.rackspace.com/ubuntu/`
- Set container timezone to environment variable `${TIMEZONE:-$DEFAULT_TIMEZONE}`, defaults to `Australia/Brisbane`