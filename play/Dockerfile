FROM alpine

# install tools
RUN apk add --update wget
RUN apk add --update curl
RUN apk add --update net-tools
RUN apk add --update python
RUN apk add --update nodejs
RUN apk add --update php5
RUN apk add --update apache2-utils
RUN apk add --update py-pip
RUN apk add --update nodejs-npm

# install node deps
RUN npm install -g lodash nodemon

COPY . /root

CMD sh
