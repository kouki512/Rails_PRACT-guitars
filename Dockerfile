FROM ruby:2.6.6

RUN apt-get update && apt-get install -y sqlite3 nodejs build-essential libsqlite3-dev 

RUN mkdir /app_name 

ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
RUN rails db:migrate
ADD . $APP_ROOT