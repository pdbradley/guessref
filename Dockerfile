FROM ruby:3.1.0

RUN apt-get update -qq \
&& apt-get install -y postgresql-client

ADD . /rails_app

WORKDIR /rails_app

RUN bundle install

EXPOSE 3000

CMD ["bash"]
