FROM ruby:2.4
RUN mkdir /code
WORKDIR /code
RUN \
    apt-get update && \
    apt-get install -y sqlite3
COPY Gemfile /code/Gemfile
COPY Gemfile.lock /code/Gemfile.lock
RUN bundle install
COPY . /code
