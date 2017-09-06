FROM ubuntu:16.04

MAINTAINER Xiao Liang Yu <me@hiubright.com>

RUN useradd -mU -d /home/nodejs nodejs

RUN apt-get update && apt-get install curl git -y

USER nodejs
WORKDIR /home/nodejs/app

RUN echo $HOME
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

# Always install the latest one
RUN . $HOME/.nvm/nvm.sh && nvm install node && nvm use node

RUN npm -g i yarn

# Copy the package.json first in order not to reinstalling dependencies when they are not changed. See http://bitjudo.com/blog/2014/03/13/building-efficient-dockerfiles-node-dot-js/
COPY package.json .

RUN yarn

COPY . .

EXPOSE 8080
EXPOSE 9000
CMD ["/bin/bash", "npm", "start"]
