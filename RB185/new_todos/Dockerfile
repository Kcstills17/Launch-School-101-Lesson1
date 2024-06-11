# Use a specific version of the Ruby image
ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION-slim as base

# Set the working directory
WORKDIR /app

# Update system and install dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential libpq-dev && \
    gem update --system --no-document && \
    gem install -N bundler

# Copy the Gemfile and Gemfile.lock into the image and install gems
COPY Gemfile* /app/
RUN bundle install

# Copy the rest of the application code
COPY . /app/

# Create a non-root user to run the app
RUN useradd ruby --home /app --shell /bin/bash
USER ruby:ruby

# Expose the port the app runs on
EXPOSE 8080

# Start the application
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "--port", "8080"]


