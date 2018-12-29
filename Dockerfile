# FROM ruby:2.6.0
# RUN apt-get update -qq && apt-get install -y \
#       libpq-dev \
#       postgresql-contrib
# RUN gem install bundler
# ENV BUNDLE_PATH /ruby_gems
# RUN mkdir /app
# WORKDIR /app
# ADD . /app
#
#
FROM ruby:2.6.0
ENV APP_HOME /app
# Installation of dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    # The following are used to trim down the size of the image by removing unneeded data
  && apt-get clean autoclean \
  && apt-get autoremove -y \
  && rm -rf \
    /var/lib/apt \
    /var/lib/dpkg \
    /var/lib/cache \
    /var/lib/log
# Create a directory for our application
# and set it as the working directory
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
# Add our Gemfile and install gems
ADD Gemfile* $APP_HOME/
RUN bundle install
# Copy over our application code
ADD . $APP_HOME
