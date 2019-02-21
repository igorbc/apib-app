FROM ruby:2.5.3

WORKDIR /usr/src/app

RUN apt-get update -qq && apt-get install -y apt-transport-https && rm -rf /var/lib/apt/lists/*

RUN apt-get update -qq \
    && apt-get install -y --no-install-recommends build-essential libpq-dev \
    postgresql-client

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY . .

EXPOSE 3000

CMD sh -c "rails db:migrate && rails s -b '0.0.0.0'"
