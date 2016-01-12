FROM alpine

# install tools
RUN apk add --update wget
RUN apk add --update curl
RUN apk add --update net-tools
RUN apk add --update python
RUN apk add --update nodejs
RUN apk add --update php
RUN apk add --update apache2-utils

# install python deps
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# install node deps
RUN npm install -g lodash nodemon

COPY . /root

CMD sh
