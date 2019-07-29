FROM ruby:2.6.3-alpine

RUN apk add --no-cache --update \
  build-base \
  postgresql-dev \
  tzdata \
  nodejs-current \
  yarn 

ENV APP /app
RUN mkdir $APP
WORKDIR $APP

ADD Gemfile* package.json yarn.lock $APP/
RUN bundle install --jobs=4
RUN NODE_ENV=development yarn install

ADD . $APP/
