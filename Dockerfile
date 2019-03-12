FROM ruby:2.6-alpine
LABEL maintainer="Digital-Learner"
#RUN apt-get update -yqq && apt-get install -yqq --no-install-recommends
RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash && \
    rm -rf /var/cache/apk/*
RUN gem install bundler
COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install
COPY . /usr/src/app/
CMD ["bin/bash"]
