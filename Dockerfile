# Start from the official ruby image, then update and install DB
FROM ruby:2.5.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Create a directory for the application and use it
RUN mkdir /myapp
WORKDIR /myapp

# Gemfile and lock file need to be present, they'll be overwritten immediately
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install gem dependencies
RUN bundle install
COPY . /myapp

# Add a script to be executed every time the container starts. It is neccesary for Rails
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process -Rails.
CMD ["rails", "server", "-b", "0.0.0.0"]