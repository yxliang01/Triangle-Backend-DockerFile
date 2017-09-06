FROM ubuntu:16.04

MAINTAINER Xiao Liang Yu <me@hiubright.com>

RUN useradd -mU -d /home/nodejs nodejs

RUN apt-get update && apt-get install curl git -y

WORKDIR /home/nodejs/app

ADD . .

RUN chown -R nodejs:nodejs .

USER nodejs

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash

# Always install the latest one
RUN bash --login -c "nvm install node && nvm use node"
RUN bash --login -c "npm -g i yarn"

RUN bash --login -c yarn

EXPOSE 8080
EXPOSE 9000

ENTRYPOINT ["/bin/bash", "--login", "-c"]
CMD ["npm", "start"]
