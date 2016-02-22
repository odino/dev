FROM alpine

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --update wrk@testing

CMD sh
