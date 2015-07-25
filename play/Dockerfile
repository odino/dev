FROM alpine

# install tools
RUN apk add --update wget curl net-tools python nodejs

# install python deps
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# install node deps
RUN npm install -g lodash nodemon

COPY . /root

CMD sh
