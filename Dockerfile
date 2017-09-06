FROM ubuntu:16.04

MAINTAINER Xiao Liang Yu <me@hiubright.com>

USER ubuntu
WORKDIR /home/ubuntu/app
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

ADD . .
RUN npm -g i yarn && yarn
ENTRYPOINT npm start
