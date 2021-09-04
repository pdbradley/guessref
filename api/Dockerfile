FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /tmp
# skip installing gem documentation
RUN echo 'gem: --no-rdoc --no-ri' >> "$HOME/.gemrc"

ADD Gemfile /tmp/ 
ADD Gemfile.lock /tmp/ 
RUN bundle install 

WORKDIR /myapp

COPY . .

# Add a script to be executed every time the container starts.
EXPOSE 3001

# Configure the main process to run when running the image
CMD rm -f tmp/pids/server.pid; rails server -b 0.0.0.0 -p 3001
