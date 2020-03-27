FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y postgresql-client
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn

RUN mkdir /currency
WORKDIR /currency
COPY Gemfile /currency/Gemfile
COPY Gemfile.lock /currency/Gemfile.lock
RUN bundle install
COPY . /currency
