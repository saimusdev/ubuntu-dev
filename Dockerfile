########################################################################################################################################
# ubuntu-dev: is a base image for Software Development under Ubuntu:Xenial
FROM ubuntu:xenial

LABEL maintainer="Saimus Dev"

#########################################################################################################################################
# NETWORKING & SOURCING

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       git=1:2.* \
       wget=1.* \
       curl=7.* \
       unzip \
       xz-utils=5.* \
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
       vim \
       zsh

#########################################################################################################################################
# OH-MY-ZSH
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true


#########################################################################################################################################
# ENTRYPOINT

ENTRYPOINT ["fixuid"]
