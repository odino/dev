FROM ruby:2.0

RUN gem install capistrano -v 2.15.5
RUN gem install hipchat capistrano-slack-notify -V
RUN mkdir /root/.ssh

WORKDIR /src
COPY . /root
RUN chmod +x /root/init.sh
CMD /root/init.sh && bash
