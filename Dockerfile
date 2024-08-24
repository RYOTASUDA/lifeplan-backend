FROM ruby:3.1.6-alpine3.20

RUN apk add --update --no-cache \
    build-base \
    gmp-dev \
    gcompat \
    libcurl \
    bash \
    git \
    curl \
    less \
    tzdata \
    mysql-client \
    mysql-dev

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

WORKDIR /myapp

COPY Gemfile Gemfile.lock /myapp/
RUN gem install bundler:2.3.19 && bundle install -j4

COPY . /myapp
