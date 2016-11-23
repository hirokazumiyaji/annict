FROM ruby:2.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs npm

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN rm /usr/sbin/node

RUN mkdir /app

WORKDIR /app

ADD Gemfile /app/Gemfile

ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD . /app

RUN npm install
