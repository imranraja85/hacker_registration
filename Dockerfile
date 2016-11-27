FROM ruby:2.3.1
MAINTAINER Imran Raja

WORKDIR /tmp
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN bundle install --system --jobs 20

WORKDIR /opt/hacker_registration
COPY . /opt/hacker_registration
