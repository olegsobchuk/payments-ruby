FROM ruby:3.0.5-alpine3.16

ARG $RAILS_ENV
ARG $RAILS_MASTER_KEY
ENV RAILS_ENV=$RAILS_ENV
ENV RAKE_ENV=$RAILS_ENV

RUN apk --update add \
        build-base \
        nodejs \
        tzdata \
        postgresql-dev postgresql-client \
        yarn
RUN gem install bundler

WORKDIR /app

COPY ./Gemfile ./Gemfile.lock ./
COPY ./package.json ./yarn.lock ./

RUN bundle install --without development test
RUN yarn

COPY . ./

CMD ["bundle", "exec", "rails", "s"]
