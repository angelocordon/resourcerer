FROM starefossen/ruby-node:latest
MAINTAINER Angelo Cordon <angelocordon@gmail.com>

RUN apt-get update -qq \
  && apt-get install -y \
  build-essential \
  libpq-dev \
  && gem install bundler \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

WORKDIR /usr/src/app

COPY Gemfile* yarn.lock /usr/src/app/
RUN bundle install
COPY . /usr/src/app

RUN yarn install && yarn check --integrity
