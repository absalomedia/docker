FROM absalomedia/ubuntu-base
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