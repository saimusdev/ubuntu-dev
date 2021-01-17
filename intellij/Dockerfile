########################################################################################################################################
# ubuntu-intellij: contains a working installation of IntelliJ IDEA
FROM ubuntu-dev-base:16.04

LABEL maintainer="Saimus Dev"

USER root

#########################################################################################################################################
# Base dependencies

RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       libxext-dev \
       libxrender-dev \
       libxslt1.1 \
       libxtst-dev \
       libgtk2.0-0 \
       libcanberra-gtk-module \
       xauth \
       openjdk-8-jdk \
       openjdk-8-doc

#########################################################################################################################################
# IntelliJ IDEA
RUN wget https://download.jetbrains.com/idea/ideaIC-2020.3.1.tar.gz -O /tmp/intellij.tar.gz && \
    mkdir -p /opt/intellij && \
    tar -xvf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \
    rm /tmp/intellij.tar.gz && \
    ln -s /opt/intellij/bin/idea.sh /usr/local/bin/idea

RUN mkdir -p /home/docker/.IdeaIC2020.3/config/options && \
    mkdir -p /home/docker/.IdeaIC2020.3/config/plugins 

#########################################################################################################################################
# Groovy SDK

USER docker

RUN curl -s get.sdkman.io | bash \
    && bash -c 'source "/home/docker/.sdkman/bin/sdkman-init.sh" && sdk install groovy'

# CMD ["idea"]
