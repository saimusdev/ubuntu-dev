########################################################################################################################################
# ubuntu-dev: is a base image for Software Development under Ubuntu:Xenial
FROM ubuntu:xenial

LABEL maintainer="Saimus Dev"

USER root

ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# Add 'universe' repos
RUN sed 's/main$/main universe/' -i /etc/apt/sources.list

#########################################################################################################################################
# NETWORKING & SOURCING
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       net-tools \
       iputils-ping \
       wget \
       curl \
       zip \
       unzip \
       xz-utils \
       software-properties-common \
       ca-certificates

#########################################################################################################################################
# FIXUID
RUN addgroup --gid 1000 docker && \
    adduser --uid 1000 --ingroup docker --home /home/docker --shell /bin/sh --disabled-password --gecos "" docker

RUN USER=docker && \
    GROUP=docker && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.1/fixuid-0.1-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

#########################################################################################################################################
# BASIC CONSOLE DEV TOOLS
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       git \
       vim \
       sudo \
       zsh

#########################################################################################################################################
# OH-MY-ZSH

USER docker
# terminal colors with xterm
ENV TERM xterm
# set the zsh theme 
ENV ZSH_THEME agnoster

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

#########################################################################################################################################
# ENTRYPOINT

WORKDIR /home/docker

ENTRYPOINT ["fixuid"]

CMD ["zsh"]
