FROM absalomedia/mini
MAINTAINER Lawrence Meckan <media@absalom.biz>

# Set correct environment variables.
ENV DOCKER_NAME rev_bazel

# Enable ssh access
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
# RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# !!! Enabling the insecure key permanently !!! REMOVE ME AT PRODUCTION
# RUN /usr/sbin/enable_insecure_key

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

### ...put your own build instructions here... ###
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
RUN apt-get -y install git curl wget python-software-properties unzip build-essential clang-3.6 python-numpy swig python-dev python-wheel software-properties-common
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.7"
RUN tee /etc/apt/sources.list.d/bazel.list
RUN curl https://bazel.build/bazel-release.pub.gpg | sudo apt-key add -
RUN apt-get update && apt-get -y install bazel

RUN curl https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 > /usr/bin/docker && chmod +x /usr/bin/docker

WORKDIR /usr/src

CMD ["/sbin/my_init"]

