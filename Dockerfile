FROM mhart/alpine-node:6
MAINTAINER xun "me@xun.my"

# refer to https://github.com/jfloff/alpine-python
RUN echo "@testing http://dl-4.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
  && apk add --update \
              musl \
              build-base \
              python3 \
              python3-dev \
							py-pip \
              bash \
  && rm /var/cache/apk/* \ 
  && cd /usr/bin \
  && ln -sf python3.4 python \
  && ln -sf python-config3.4 python-config \
  && ln -sf pip3.4 pip \
  && npm install -g swagger2aglio \
  && apk del musl \
						build-base \
						python3 \
						py-pip \
						bash

# CMD ["swagger2aglio", "--help"]
# docker build -t axnux/swagger2aglio:latest . #
