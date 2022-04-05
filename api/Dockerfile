FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /tmp
# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"
# RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash


COPY Gemfile /tmp/ 
COPY Gemfile.lock /tmp/ 
RUN bundle install 

WORKDIR /myapp

COPY . .

EXPOSE 3001

# Add a script to be executed every time the container starts.
ENTRYPOINT ["bin/docker-entry"]
# Configure the main process to run when running the image
CMD rails server -b 0.0.0.0 -p 3001
