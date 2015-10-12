# Use phusion/baseimage as base image. To make your builds
# reproducible, make sure you lock down to a specific version, not
# to `latest`! See
# https://github.com/phusion/baseimage-docker/blob/master/Changelog.md
# for a list of version numbers.
FROM phusion/baseimage:0.9.17
MAINTAINER Lawrence Meckan <media@absalom.biz>

# Set correct environment variables.
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV DOCKER_NAME rev_openjdk

# install java
RUN apt-get update && \
    apt-get install -y \
    	openjdk-7-jre-headless && \
    apt-get clean